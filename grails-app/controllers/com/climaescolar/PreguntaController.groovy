package com.climaescolar

import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class PreguntaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [preguntaInstanceList: Pregunta.list(params), preguntaInstanceTotal: Pregunta.count()]
    }

    def create() {
        [preguntaInstance: new Pregunta(params)]
    }

    def save() {
        def preguntaInstance = new Pregunta(params)
        if (!preguntaInstance.save(flush: true)) {
            render(view: "create", model: [preguntaInstance: preguntaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'pregunta.label', default: 'Pregunta'), preguntaInstance.id])
        redirect(action: "show", id: preguntaInstance.id)
    }

    def show(Long id) {
        def preguntaInstance = Pregunta.get(id)
        if (!preguntaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pregunta.label', default: 'Pregunta'), id])
            redirect(action: "list")
            return
        }

        [preguntaInstance: preguntaInstance]
    }

    def edit(Long id) {
        def preguntaInstance = Pregunta.get(id)
        if (!preguntaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pregunta.label', default: 'Pregunta'), id])
            redirect(action: "list")
            return
        }

        [preguntaInstance: preguntaInstance]
    }

    def update(Long id, Long version) {
        def preguntaInstance = Pregunta.get(id)
        if (!preguntaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pregunta.label', default: 'Pregunta'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (preguntaInstance.version > version) {
                preguntaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'pregunta.label', default: 'Pregunta')] as Object[],
                          "Another user has updated this Pregunta while you were editing")
                render(view: "edit", model: [preguntaInstance: preguntaInstance])
                return
            }
        }

        preguntaInstance.properties = params

        if (!preguntaInstance.save(flush: true)) {
            render(view: "edit", model: [preguntaInstance: preguntaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'pregunta.label', default: 'Pregunta'), preguntaInstance.id])
        redirect(action: "show", id: preguntaInstance.id)
    }

    def delete(Long id) {
        def preguntaInstance = Pregunta.get(id)
        if (!preguntaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pregunta.label', default: 'Pregunta'), id])
            redirect(action: "list")
            return
        }

        try {
            preguntaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'pregunta.label', default: 'Pregunta'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pregunta.label', default: 'Pregunta'), id])
            redirect(action: "show", id: id)
        }
    }
}
