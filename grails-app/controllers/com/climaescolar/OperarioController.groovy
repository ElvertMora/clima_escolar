package com.climaescolar

import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class OperarioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [operarioInstanceList: Operario.list(params), operarioInstanceTotal: Operario.count()]
    }

    def create() {
        [operarioInstance: new Operario(params)]
    }

    def save() {
        def operarioInstance = new Operario(params)
        if (!operarioInstance.save(flush: true)) {
            render(view: "create", model: [operarioInstance: operarioInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'operario.label', default: 'Operario'), operarioInstance.id])
        redirect(action: "show", id: operarioInstance.id)
    }

    def show(Long id) {
        def operarioInstance = Operario.get(id)
        if (!operarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'operario.label', default: 'Operario'), id])
            redirect(action: "list")
            return
        }

        [operarioInstance: operarioInstance]
    }

    def edit(Long id) {
        def operarioInstance = Operario.get(id)
        if (!operarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'operario.label', default: 'Operario'), id])
            redirect(action: "list")
            return
        }

        [operarioInstance: operarioInstance]
    }

    def update(Long id, Long version) {
        def operarioInstance = Operario.get(id)
        if (!operarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'operario.label', default: 'Operario'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (operarioInstance.version > version) {
                operarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'operario.label', default: 'Operario')] as Object[],
                          "Another user has updated this Operario while you were editing")
                render(view: "edit", model: [operarioInstance: operarioInstance])
                return
            }
        }

        operarioInstance.properties = params

        if (!operarioInstance.save(flush: true)) {
            render(view: "edit", model: [operarioInstance: operarioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'operario.label', default: 'Operario'), operarioInstance.id])
        redirect(action: "show", id: operarioInstance.id)
    }

    def delete(Long id) {
        def operarioInstance = Operario.get(id)
        if (!operarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'operario.label', default: 'Operario'), id])
            redirect(action: "list")
            return
        }

        try {
            operarioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'operario.label', default: 'Operario'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'operario.label', default: 'Operario'), id])
            redirect(action: "show", id: id)
        }
    }
}
