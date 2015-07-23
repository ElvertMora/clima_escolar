package com.climaescolar

import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class GradoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [gradoInstanceList: Grado.list(params), gradoInstanceTotal: Grado.count()]
    }

    def create() {
        [gradoInstance: new Grado(params)]
    }

    def save() {
        def gradoInstance = new Grado(params)
        if (!gradoInstance.save(flush: true)) {
            render(view: "create", model: [gradoInstance: gradoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'grado.label', default: 'Grado'), gradoInstance.id])
        redirect(action: "show", id: gradoInstance.id)
    }

    def show(Long id) {
        def gradoInstance = Grado.get(id)
        if (!gradoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'grado.label', default: 'Grado'), id])
            redirect(action: "list")
            return
        }

        [gradoInstance: gradoInstance]
    }

    def edit(Long id) {
        def gradoInstance = Grado.get(id)
        if (!gradoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'grado.label', default: 'Grado'), id])
            redirect(action: "list")
            return
        }

        [gradoInstance: gradoInstance]
    }

    def update(Long id, Long version) {
        def gradoInstance = Grado.get(id)
        if (!gradoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'grado.label', default: 'Grado'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (gradoInstance.version > version) {
                gradoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'grado.label', default: 'Grado')] as Object[],
                          "Another user has updated this Grado while you were editing")
                render(view: "edit", model: [gradoInstance: gradoInstance])
                return
            }
        }

        gradoInstance.properties = params

        if (!gradoInstance.save(flush: true)) {
            render(view: "edit", model: [gradoInstance: gradoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'grado.label', default: 'Grado'), gradoInstance.id])
        redirect(action: "show", id: gradoInstance.id)
    }

    def delete(Long id) {
        def gradoInstance = Grado.get(id)
        if (!gradoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'grado.label', default: 'Grado'), id])
            redirect(action: "list")
            return
        }

        try {
            gradoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'grado.label', default: 'Grado'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'grado.label', default: 'Grado'), id])
            redirect(action: "show", id: id)
        }
    }
}
