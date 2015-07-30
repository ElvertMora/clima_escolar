package com.climaescolar

import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class CordinadorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [cordinadorInstanceList: Cordinador.list(params), cordinadorInstanceTotal: Cordinador.count()]
    }

    def create() {
        [cordinadorInstance: new Cordinador(params)]
    }

    def save() {
        def cordinadorInstance = new Cordinador(params)
        if (!cordinadorInstance.save(flush: true)) {
            render(view: "create", model: [cordinadorInstance: cordinadorInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'cordinador.label', default: 'Cordinador'), cordinadorInstance.id])
        redirect(action: "show", id: cordinadorInstance.id)
    }

    def show(Long id) {
        def cordinadorInstance = Cordinador.get(id)
        if (!cordinadorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cordinador.label', default: 'Cordinador'), id])
            redirect(action: "list")
            return
        }

        [cordinadorInstance: cordinadorInstance]
    }

    def edit(Long id) {
        def cordinadorInstance = Cordinador.get(id)
        if (!cordinadorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cordinador.label', default: 'Cordinador'), id])
            redirect(action: "list")
            return
        }

        [cordinadorInstance: cordinadorInstance]
    }

    def update(Long id, Long version) {
        def cordinadorInstance = Cordinador.get(id)
        if (!cordinadorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cordinador.label', default: 'Cordinador'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (cordinadorInstance.version > version) {
                cordinadorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cordinador.label', default: 'Cordinador')] as Object[],
                          "Another user has updated this Cordinador while you were editing")
                render(view: "edit", model: [cordinadorInstance: cordinadorInstance])
                return
            }
        }

        cordinadorInstance.properties = params

        if (!cordinadorInstance.save(flush: true)) {
            render(view: "edit", model: [cordinadorInstance: cordinadorInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'cordinador.label', default: 'Cordinador'), cordinadorInstance.id])
        redirect(action: "show", id: cordinadorInstance.id)
    }

    def delete(Long id) {
        def cordinadorInstance = Cordinador.get(id)
        if (!cordinadorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cordinador.label', default: 'Cordinador'), id])
            redirect(action: "list")
            return
        }

        try {
            cordinadorInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'cordinador.label', default: 'Cordinador'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cordinador.label', default: 'Cordinador'), id])
            redirect(action: "show", id: id)
        }
    }
}
