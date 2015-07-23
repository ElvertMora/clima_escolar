package com.climaescolar

import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class AnalistaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [analistaInstanceList: Analista.list(params), analistaInstanceTotal: Analista.count()]
    }

    def create() {
        [analistaInstance: new Analista(params)]
    }

    def save() {
        def analistaInstance = new Analista(params)
        if (!analistaInstance.save(flush: true)) {
            render(view: "create", model: [analistaInstance: analistaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'analista.label', default: 'Analista'), analistaInstance.id])
        redirect(action: "show", id: analistaInstance.id)
    }

    def show(Long id) {
        def analistaInstance = Analista.get(id)
        if (!analistaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'analista.label', default: 'Analista'), id])
            redirect(action: "list")
            return
        }

        [analistaInstance: analistaInstance]
    }

    def edit(Long id) {
        def analistaInstance = Analista.get(id)
        if (!analistaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'analista.label', default: 'Analista'), id])
            redirect(action: "list")
            return
        }

        [analistaInstance: analistaInstance]
    }

    def update(Long id, Long version) {
        def analistaInstance = Analista.get(id)
        if (!analistaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'analista.label', default: 'Analista'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (analistaInstance.version > version) {
                analistaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'analista.label', default: 'Analista')] as Object[],
                          "Another user has updated this Analista while you were editing")
                render(view: "edit", model: [analistaInstance: analistaInstance])
                return
            }
        }

        analistaInstance.properties = params

        if (!analistaInstance.save(flush: true)) {
            render(view: "edit", model: [analistaInstance: analistaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'analista.label', default: 'Analista'), analistaInstance.id])
        redirect(action: "show", id: analistaInstance.id)
    }

    def delete(Long id) {
        def analistaInstance = Analista.get(id)
        if (!analistaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'analista.label', default: 'Analista'), id])
            redirect(action: "list")
            return
        }

        try {
            analistaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'analista.label', default: 'Analista'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'analista.label', default: 'Analista'), id])
            redirect(action: "show", id: id)
        }
    }
}
