package com.climaescolar

import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class JornadaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [jornadaInstanceList: Jornada.list(params), jornadaInstanceTotal: Jornada.count()]
    }

    def create() {
        [jornadaInstance: new Jornada(params)]
    }

    def save() {
        def jornadaInstance = new Jornada(params)
        if (!jornadaInstance.save(flush: true)) {
            render(view: "create", model: [jornadaInstance: jornadaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'jornada.label', default: 'Jornada'), jornadaInstance.id])
        redirect(action: "show", id: jornadaInstance.id)
    }

    def show(Long id) {
        def jornadaInstance = Jornada.get(id)
        if (!jornadaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'jornada.label', default: 'Jornada'), id])
            redirect(action: "list")
            return
        }

        [jornadaInstance: jornadaInstance]
    }

    def edit(Long id) {
        def jornadaInstance = Jornada.get(id)
        if (!jornadaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'jornada.label', default: 'Jornada'), id])
            redirect(action: "list")
            return
        }

        [jornadaInstance: jornadaInstance]
    }

    def update(Long id, Long version) {
        def jornadaInstance = Jornada.get(id)
        if (!jornadaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'jornada.label', default: 'Jornada'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (jornadaInstance.version > version) {
                jornadaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'jornada.label', default: 'Jornada')] as Object[],
                          "Another user has updated this Jornada while you were editing")
                render(view: "edit", model: [jornadaInstance: jornadaInstance])
                return
            }
        }

        jornadaInstance.properties = params

        if (!jornadaInstance.save(flush: true)) {
            render(view: "edit", model: [jornadaInstance: jornadaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'jornada.label', default: 'Jornada'), jornadaInstance.id])
        redirect(action: "show", id: jornadaInstance.id)
    }

    def delete(Long id) {
        def jornadaInstance = Jornada.get(id)
        if (!jornadaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'jornada.label', default: 'Jornada'), id])
            redirect(action: "list")
            return
        }

        try {
            jornadaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'jornada.label', default: 'Jornada'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'jornada.label', default: 'Jornada'), id])
            redirect(action: "show", id: id)
        }
    }
}
