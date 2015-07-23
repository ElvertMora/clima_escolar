package com.climaescolar



import org.junit.*
import grails.test.mixin.*

@TestFor(HojaDeRespuestasController)
@Mock(HojaDeRespuestas)
class HojaDeRespuestasControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/hojaDeRespuestas/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.hojaDeRespuestasInstanceList.size() == 0
        assert model.hojaDeRespuestasInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.hojaDeRespuestasInstance != null
    }

    void testSave() {
        controller.save()

        assert model.hojaDeRespuestasInstance != null
        assert view == '/hojaDeRespuestas/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/hojaDeRespuestas/show/1'
        assert controller.flash.message != null
        assert HojaDeRespuestas.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/hojaDeRespuestas/list'

        populateValidParams(params)
        def hojaDeRespuestas = new HojaDeRespuestas(params)

        assert hojaDeRespuestas.save() != null

        params.id = hojaDeRespuestas.id

        def model = controller.show()

        assert model.hojaDeRespuestasInstance == hojaDeRespuestas
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/hojaDeRespuestas/list'

        populateValidParams(params)
        def hojaDeRespuestas = new HojaDeRespuestas(params)

        assert hojaDeRespuestas.save() != null

        params.id = hojaDeRespuestas.id

        def model = controller.edit()

        assert model.hojaDeRespuestasInstance == hojaDeRespuestas
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/hojaDeRespuestas/list'

        response.reset()

        populateValidParams(params)
        def hojaDeRespuestas = new HojaDeRespuestas(params)

        assert hojaDeRespuestas.save() != null

        // test invalid parameters in update
        params.id = hojaDeRespuestas.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/hojaDeRespuestas/edit"
        assert model.hojaDeRespuestasInstance != null

        hojaDeRespuestas.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/hojaDeRespuestas/show/$hojaDeRespuestas.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        hojaDeRespuestas.clearErrors()

        populateValidParams(params)
        params.id = hojaDeRespuestas.id
        params.version = -1
        controller.update()

        assert view == "/hojaDeRespuestas/edit"
        assert model.hojaDeRespuestasInstance != null
        assert model.hojaDeRespuestasInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/hojaDeRespuestas/list'

        response.reset()

        populateValidParams(params)
        def hojaDeRespuestas = new HojaDeRespuestas(params)

        assert hojaDeRespuestas.save() != null
        assert HojaDeRespuestas.count() == 1

        params.id = hojaDeRespuestas.id

        controller.delete()

        assert HojaDeRespuestas.count() == 0
        assert HojaDeRespuestas.get(hojaDeRespuestas.id) == null
        assert response.redirectedUrl == '/hojaDeRespuestas/list'
    }
}
