package com.climaescolar

import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class EncuestaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [encuestaInstanceList: Encuesta.list(params), encuestaInstanceTotal: Encuesta.count()]
    }

    def create() {
        [encuestaInstance: new Encuesta(params)]
    }

    def save() {
        def encuestaInstance = new Encuesta(params)
        if (!encuestaInstance.save(flush: true)) {
            render(view: "create", model: [encuestaInstance: encuestaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'encuesta.label', default: 'Encuesta'), encuestaInstance.id])
        redirect(action: "show", id: encuestaInstance.id)
    }

    def show(Long id) {
        def encuestaInstance = Encuesta.get(id)
        if (!encuestaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'encuesta.label', default: 'Encuesta'), id])
            redirect(action: "list")
            return
        }

        [encuestaInstance: encuestaInstance]
    }

    def edit(Long id) {
        def encuestaInstance = Encuesta.get(id)
        if (!encuestaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'encuesta.label', default: 'Encuesta'), id])
            redirect(action: "list")
            return
        }

        [encuestaInstance: encuestaInstance]
    }

    def update(Long id, Long version) {
        def encuestaInstance = Encuesta.get(id)
        if (!encuestaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'encuesta.label', default: 'Encuesta'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (encuestaInstance.version > version) {
                encuestaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'encuesta.label', default: 'Encuesta')] as Object[],
                          "Another user has updated this Encuesta while you were editing")
                render(view: "edit", model: [encuestaInstance: encuestaInstance])
                return
            }
        }

        encuestaInstance.properties = params

        if (!encuestaInstance.save(flush: true)) {
            render(view: "edit", model: [encuestaInstance: encuestaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'encuesta.label', default: 'Encuesta'), encuestaInstance.id])
        redirect(action: "show", id: encuestaInstance.id)
    }

    def delete(Long id) {
        def encuestaInstance = Encuesta.get(id)
        if (!encuestaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'encuesta.label', default: 'Encuesta'), id])
            redirect(action: "list")
            return
        }

        try {
            encuestaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'encuesta.label', default: 'Encuesta'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'encuesta.label', default: 'Encuesta'), id])
            redirect(action: "show", id: id)
        }
    }
}
