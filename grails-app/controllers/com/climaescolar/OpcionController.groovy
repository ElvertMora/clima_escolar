package com.climaescolar

import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class OpcionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [opcionInstanceList: Opcion.list(params), opcionInstanceTotal: Opcion.count()]
    }

    def create() {
        [opcionInstance: new Opcion(params)]
    }

    def save() {
        def opcionInstance = new Opcion(params)
        if (!opcionInstance.save(flush: true)) {
            render(view: "create", model: [opcionInstance: opcionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'opcion.label', default: 'Opcion'), opcionInstance.id])
        redirect(action: "show", id: opcionInstance.id)
    }

    def show(Long id) {
        def opcionInstance = Opcion.get(id)
        if (!opcionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'opcion.label', default: 'Opcion'), id])
            redirect(action: "list")
            return
        }

        [opcionInstance: opcionInstance]
    }

    def edit(Long id) {
        def opcionInstance = Opcion.get(id)
        if (!opcionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'opcion.label', default: 'Opcion'), id])
            redirect(action: "list")
            return
        }

        [opcionInstance: opcionInstance]
    }

    def update(Long id, Long version) {
        def opcionInstance = Opcion.get(id)
        if (!opcionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'opcion.label', default: 'Opcion'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (opcionInstance.version > version) {
                opcionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'opcion.label', default: 'Opcion')] as Object[],
                          "Another user has updated this Opcion while you were editing")
                render(view: "edit", model: [opcionInstance: opcionInstance])
                return
            }
        }

        opcionInstance.properties = params

        if (!opcionInstance.save(flush: true)) {
            render(view: "edit", model: [opcionInstance: opcionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'opcion.label', default: 'Opcion'), opcionInstance.id])
        redirect(action: "show", id: opcionInstance.id)
    }

    def delete(Long id) {
        def opcionInstance = Opcion.get(id)
        if (!opcionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'opcion.label', default: 'Opcion'), id])
            redirect(action: "list")
            return
        }

        try {
            opcionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'opcion.label', default: 'Opcion'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'opcion.label', default: 'Opcion'), id])
            redirect(action: "show", id: id)
        }
    }
}
