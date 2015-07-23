package com.climaescolar



import org.junit.*
import grails.test.mixin.*

@TestFor(CordinadorController)
@Mock(Cordinador)
class CordinadorControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/cordinador/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.cordinadorInstanceList.size() == 0
        assert model.cordinadorInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.cordinadorInstance != null
    }

    void testSave() {
        controller.save()

        assert model.cordinadorInstance != null
        assert view == '/cordinador/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/cordinador/show/1'
        assert controller.flash.message != null
        assert Cordinador.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/cordinador/list'

        populateValidParams(params)
        def cordinador = new Cordinador(params)

        assert cordinador.save() != null

        params.id = cordinador.id

        def model = controller.show()

        assert model.cordinadorInstance == cordinador
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/cordinador/list'

        populateValidParams(params)
        def cordinador = new Cordinador(params)

        assert cordinador.save() != null

        params.id = cordinador.id

        def model = controller.edit()

        assert model.cordinadorInstance == cordinador
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/cordinador/list'

        response.reset()

        populateValidParams(params)
        def cordinador = new Cordinador(params)

        assert cordinador.save() != null

        // test invalid parameters in update
        params.id = cordinador.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/cordinador/edit"
        assert model.cordinadorInstance != null

        cordinador.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/cordinador/show/$cordinador.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        cordinador.clearErrors()

        populateValidParams(params)
        params.id = cordinador.id
        params.version = -1
        controller.update()

        assert view == "/cordinador/edit"
        assert model.cordinadorInstance != null
        assert model.cordinadorInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/cordinador/list'

        response.reset()

        populateValidParams(params)
        def cordinador = new Cordinador(params)

        assert cordinador.save() != null
        assert Cordinador.count() == 1

        params.id = cordinador.id

        controller.delete()

        assert Cordinador.count() == 0
        assert Cordinador.get(cordinador.id) == null
        assert response.redirectedUrl == '/cordinador/list'
    }
}
