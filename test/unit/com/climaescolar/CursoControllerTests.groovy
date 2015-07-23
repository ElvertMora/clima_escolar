package com.climaescolar



import org.junit.*
import grails.test.mixin.*

@TestFor(CursoController)
@Mock(Curso)
class CursoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/curso/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.cursoInstanceList.size() == 0
        assert model.cursoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.cursoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.cursoInstance != null
        assert view == '/curso/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/curso/show/1'
        assert controller.flash.message != null
        assert Curso.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/curso/list'

        populateValidParams(params)
        def curso = new Curso(params)

        assert curso.save() != null

        params.id = curso.id

        def model = controller.show()

        assert model.cursoInstance == curso
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/curso/list'

        populateValidParams(params)
        def curso = new Curso(params)

        assert curso.save() != null

        params.id = curso.id

        def model = controller.edit()

        assert model.cursoInstance == curso
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/curso/list'

        response.reset()

        populateValidParams(params)
        def curso = new Curso(params)

        assert curso.save() != null

        // test invalid parameters in update
        params.id = curso.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/curso/edit"
        assert model.cursoInstance != null

        curso.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/curso/show/$curso.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        curso.clearErrors()

        populateValidParams(params)
        params.id = curso.id
        params.version = -1
        controller.update()

        assert view == "/curso/edit"
        assert model.cursoInstance != null
        assert model.cursoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/curso/list'

        response.reset()

        populateValidParams(params)
        def curso = new Curso(params)

        assert curso.save() != null
        assert Curso.count() == 1

        params.id = curso.id

        controller.delete()

        assert Curso.count() == 0
        assert Curso.get(curso.id) == null
        assert response.redirectedUrl == '/curso/list'
    }
}
