package com.climaescolar

import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_OPERARIO','ROLE_CORDINADOR'])
class AccionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [accionInstanceList: Accion.list(params), accionInstanceTotal: Accion.count()]
    }

    def create() {
        [accionInstance: new Accion(params)]
    }

    def save() {
        def accionInstance = new Accion(params)
        if (!accionInstance.save(flush: true)) {
            render(view: "create", model: [accionInstance: accionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'accion.label', default: 'Accion'), accionInstance.id])
        redirect(action: "show", id: accionInstance.id)
    }

    def show(Long id) {
        def accionInstance = Accion.get(id)
        if (!accionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'accion.label', default: 'Accion'), id])
            redirect(action: "list")
            return
        }

        [accionInstance: accionInstance]
    }

    def edit(Long id) {
        def accionInstance = Accion.get(id)
        if (!accionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'accion.label', default: 'Accion'), id])
            redirect(action: "list")
            return
        }

        [accionInstance: accionInstance]
    }

    def update(Long id, Long version) {
        def accionInstance = Accion.get(id)
        if (!accionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'accion.label', default: 'Accion'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (accionInstance.version > version) {
                accionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'accion.label', default: 'Accion')] as Object[],
                          "Another user has updated this Accion while you were editing")
                render(view: "edit", model: [accionInstance: accionInstance])
                return
            }
        }

        accionInstance.properties = params

        if (!accionInstance.save(flush: true)) {
            render(view: "edit", model: [accionInstance: accionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'accion.label', default: 'Accion'), accionInstance.id])
        redirect(action: "show", id: accionInstance.id)
    }

    def delete(Long id) {
        def accionInstance = Accion.get(id)
        if (!accionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'accion.label', default: 'Accion'), id])
            redirect(action: "list")
            return
        }

        try {
            accionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'accion.label', default: 'Accion'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'accion.label', default: 'Accion'), id])
            redirect(action: "show", id: id)
        }
    }
}
