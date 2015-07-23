package com.climaescolar

import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class HojaDeRespuestasController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [hojaDeRespuestasInstanceList: HojaDeRespuestas.list(params), hojaDeRespuestasInstanceTotal: HojaDeRespuestas.count()]
    }

    def create() {
        [hojaDeRespuestasInstance: new HojaDeRespuestas(params)]
    }

    def save() {
        def hojaDeRespuestasInstance = new HojaDeRespuestas(params)
        if (!hojaDeRespuestasInstance.save(flush: true)) {
            render(view: "create", model: [hojaDeRespuestasInstance: hojaDeRespuestasInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'hojaDeRespuestas.label', default: 'HojaDeRespuestas'), hojaDeRespuestasInstance.id])
        redirect(action: "show", id: hojaDeRespuestasInstance.id)
    }

    def show(Long id) {
        def hojaDeRespuestasInstance = HojaDeRespuestas.get(id)
        if (!hojaDeRespuestasInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hojaDeRespuestas.label', default: 'HojaDeRespuestas'), id])
            redirect(action: "list")
            return
        }

        [hojaDeRespuestasInstance: hojaDeRespuestasInstance]
    }

    def edit(Long id) {
        def hojaDeRespuestasInstance = HojaDeRespuestas.get(id)
        if (!hojaDeRespuestasInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hojaDeRespuestas.label', default: 'HojaDeRespuestas'), id])
            redirect(action: "list")
            return
        }

        [hojaDeRespuestasInstance: hojaDeRespuestasInstance]
    }

    def update(Long id, Long version) {
        def hojaDeRespuestasInstance = HojaDeRespuestas.get(id)
        if (!hojaDeRespuestasInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hojaDeRespuestas.label', default: 'HojaDeRespuestas'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (hojaDeRespuestasInstance.version > version) {
                hojaDeRespuestasInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'hojaDeRespuestas.label', default: 'HojaDeRespuestas')] as Object[],
                          "Another user has updated this HojaDeRespuestas while you were editing")
                render(view: "edit", model: [hojaDeRespuestasInstance: hojaDeRespuestasInstance])
                return
            }
        }

        hojaDeRespuestasInstance.properties = params

        if (!hojaDeRespuestasInstance.save(flush: true)) {
            render(view: "edit", model: [hojaDeRespuestasInstance: hojaDeRespuestasInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'hojaDeRespuestas.label', default: 'HojaDeRespuestas'), hojaDeRespuestasInstance.id])
        redirect(action: "show", id: hojaDeRespuestasInstance.id)
    }

    def delete(Long id) {
        def hojaDeRespuestasInstance = HojaDeRespuestas.get(id)
        if (!hojaDeRespuestasInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hojaDeRespuestas.label', default: 'HojaDeRespuestas'), id])
            redirect(action: "list")
            return
        }

        try {
            hojaDeRespuestasInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'hojaDeRespuestas.label', default: 'HojaDeRespuestas'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'hojaDeRespuestas.label', default: 'HojaDeRespuestas'), id])
            redirect(action: "show", id: id)
        }
    }
}
