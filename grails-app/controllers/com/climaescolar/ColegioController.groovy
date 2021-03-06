package com.climaescolar

import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_OPERARIO','ROLE_CORDINADOR'])
class ColegioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [colegioInstanceList: Colegio.list(params), colegioInstanceTotal: Colegio.count()]
    }
    
    def resultados() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100) 
        def c = Colegio.createCriteria()
        //def results = c.list(max:params.max, offset: params.offset ?: 0){ 
        def results = c.list{   
            and{
                if(params.nombreInstitucion!='' && params.nombreInstitucion){
                    ilike("nombreInstitucion", "%"+params.nombreInstitucion+"%")
                }
                if(params.direccion!='' && params.direccion){
                    ilike("direccion", "%"+params.direccion+"%")
                }            
                if(params.barrio!='' && params.barrio){
                    ilike("barrio", "%"+params.barrio+"%")
                }
                if(params.telefono !='' && params.telefono){
                like("telefono", "%"+params.telefono+"%")
                }
                if(params.dane!='' && params.dane){
                        like("dane", params.dane+"%")
                }
                if(params.tipoInstitucion!='null'){
                    eq("tipoInstitucion", Colegio.TipoColegio.valueOf(params.tipoInstitucion))
                }
                if(params.localidad.id!='null'){
                    localidad{
                        eq("id", new Integer(params.localidad.id))
                    } 
                }
            }
        }         
        [colegioInstanceList: results] 
    }
    
    def search() {
        [colegioInstance: new Colegio(params)]
    }
    
    def create() {
        [colegioInstance: new Colegio(params)]
    }

    def save() {
        def colegioInstance = new Colegio(params)
        if (!colegioInstance.save(flush: true)) {
            render(view: "create", model: [colegioInstance: colegioInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'colegio.label', default: 'Colegio'), colegioInstance.id])
        redirect(action: "show", id: colegioInstance.id)
    }

    def show(Long id) {
        def colegioInstance = Colegio.get(id)
        if (!colegioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'colegio.label', default: 'Colegio'), id])
            redirect(action: "list")
            return
        }

        [colegioInstance: colegioInstance]
    }

    def edit(Long id) {
        def colegioInstance = Colegio.get(id)
        if (!colegioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'colegio.label', default: 'Colegio'), id])
            redirect(action: "list")
            return
        }

        [colegioInstance: colegioInstance]
    }

    def update(Long id, Long version) {
        def colegioInstance = Colegio.get(id)
        if (!colegioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'colegio.label', default: 'Colegio'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (colegioInstance.version > version) {
                colegioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'colegio.label', default: 'Colegio')] as Object[],
                          "Another user has updated this Colegio while you were editing")
                render(view: "edit", model: [colegioInstance: colegioInstance])
                return
            }
        }

        colegioInstance.properties = params

        if (!colegioInstance.save(flush: true)) {
            render(view: "edit", model: [colegioInstance: colegioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'colegio.label', default: 'Colegio'), colegioInstance.id])
        redirect(action: "show", id: colegioInstance.id)
    }

    def delete(Long id) {
        def colegioInstance = Colegio.get(id)
        if (!colegioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'colegio.label', default: 'Colegio'), id])
            redirect(action: "list")
            return
        }

        try {
            colegioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'colegio.label', default: 'Colegio'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'colegio.label', default: 'Colegio'), id])
            redirect(action: "show", id: id)
        }
    }
}
