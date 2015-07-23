package com.climaescolar

import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class RespuestaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [respuestaInstanceList: Respuesta.list(params), respuestaInstanceTotal: Respuesta.count()]
    }

    def create() {
        [respuestaInstance: new Respuesta(params)]
    }

    def save() {
        def respuestaInstance = new Respuesta(params)
        if (!respuestaInstance.save(flush: true)) {
            render(view: "create", model: [respuestaInstance: respuestaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'respuesta.label', default: 'Respuesta'), respuestaInstance.id])
        redirect(action: "show", id: respuestaInstance.id)
    }

    def show(Long id) {
        def respuestaInstance = Respuesta.get(id)
        if (!respuestaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'respuesta.label', default: 'Respuesta'), id])
            redirect(action: "list")
            return
        }

        [respuestaInstance: respuestaInstance]
    }

    def edit(Long id) {
        def respuestaInstance = Respuesta.get(id)
        if (!respuestaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'respuesta.label', default: 'Respuesta'), id])
            redirect(action: "list")
            return
        }

        [respuestaInstance: respuestaInstance]
    }

    def update(Long id, Long version) {
        def respuestaInstance = Respuesta.get(id)
        if (!respuestaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'respuesta.label', default: 'Respuesta'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (respuestaInstance.version > version) {
                respuestaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'respuesta.label', default: 'Respuesta')] as Object[],
                          "Another user has updated this Respuesta while you were editing")
                render(view: "edit", model: [respuestaInstance: respuestaInstance])
                return
            }
        }

        respuestaInstance.properties = params

        if (!respuestaInstance.save(flush: true)) {
            render(view: "edit", model: [respuestaInstance: respuestaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'respuesta.label', default: 'Respuesta'), respuestaInstance.id])
        redirect(action: "show", id: respuestaInstance.id)
    }

    def delete(Long id) {
        def respuestaInstance = Respuesta.get(id)
        if (!respuestaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'respuesta.label', default: 'Respuesta'), id])
            redirect(action: "list")
            return
        }

        try {
            respuestaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'respuesta.label', default: 'Respuesta'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'respuesta.label', default: 'Respuesta'), id])
            redirect(action: "show", id: id)
        }
    }
}
