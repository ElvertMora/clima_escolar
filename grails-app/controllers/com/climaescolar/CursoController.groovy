package com.climaescolar

import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class CursoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [cursoInstanceList: Curso.list(params), cursoInstanceTotal: Curso.count()]
    }

    def create() {
        [cursoInstance: new Curso(params)]
    }

    def save() {
        def cursoInstance = new Curso(params)
        if (!cursoInstance.save(flush: true)) {
            render(view: "create", model: [cursoInstance: cursoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'curso.label', default: 'Curso'), cursoInstance.id])
        redirect(action: "show", id: cursoInstance.id)
    }

    def show(Long id) {
        def cursoInstance = Curso.get(id)
        if (!cursoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'curso.label', default: 'Curso'), id])
            redirect(action: "list")
            return
        }

        [cursoInstance: cursoInstance]
    }

    def edit(Long id) {
        def cursoInstance = Curso.get(id)
        if (!cursoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'curso.label', default: 'Curso'), id])
            redirect(action: "list")
            return
        }

        [cursoInstance: cursoInstance]
    }

    def update(Long id, Long version) {
        def cursoInstance = Curso.get(id)
        if (!cursoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'curso.label', default: 'Curso'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (cursoInstance.version > version) {
                cursoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'curso.label', default: 'Curso')] as Object[],
                          "Another user has updated this Curso while you were editing")
                render(view: "edit", model: [cursoInstance: cursoInstance])
                return
            }
        }

        cursoInstance.properties = params

        if (!cursoInstance.save(flush: true)) {
            render(view: "edit", model: [cursoInstance: cursoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'curso.label', default: 'Curso'), cursoInstance.id])
        redirect(action: "show", id: cursoInstance.id)
    }

    def delete(Long id) {
        def cursoInstance = Curso.get(id)
        if (!cursoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'curso.label', default: 'Curso'), id])
            redirect(action: "list")
            return
        }

        try {
            cursoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'curso.label', default: 'Curso'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'curso.label', default: 'Curso'), id])
            redirect(action: "show", id: id)
        }
    }
}
