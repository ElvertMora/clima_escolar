package com.climaescolar



import org.junit.*
import grails.test.mixin.*

@TestFor(RespuestaController)
@Mock(Respuesta)
class RespuestaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/respuesta/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.respuestaInstanceList.size() == 0
        assert model.respuestaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.respuestaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.respuestaInstance != null
        assert view == '/respuesta/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/respuesta/show/1'
        assert controller.flash.message != null
        assert Respuesta.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/respuesta/list'

        populateValidParams(params)
        def respuesta = new Respuesta(params)

        assert respuesta.save() != null

        params.id = respuesta.id

        def model = controller.show()

        assert model.respuestaInstance == respuesta
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/respuesta/list'

        populateValidParams(params)
        def respuesta = new Respuesta(params)

        assert respuesta.save() != null

        params.id = respuesta.id

        def model = controller.edit()

        assert model.respuestaInstance == respuesta
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/respuesta/list'

        response.reset()

        populateValidParams(params)
        def respuesta = new Respuesta(params)

        assert respuesta.save() != null

        // test invalid parameters in update
        params.id = respuesta.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/respuesta/edit"
        assert model.respuestaInstance != null

        respuesta.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/respuesta/show/$respuesta.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        respuesta.clearErrors()

        populateValidParams(params)
        params.id = respuesta.id
        params.version = -1
        controller.update()

        assert view == "/respuesta/edit"
        assert model.respuestaInstance != null
        assert model.respuestaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/respuesta/list'

        response.reset()

        populateValidParams(params)
        def respuesta = new Respuesta(params)

        assert respuesta.save() != null
        assert Respuesta.count() == 1

        params.id = respuesta.id

        controller.delete()

        assert Respuesta.count() == 0
        assert Respuesta.get(respuesta.id) == null
        assert response.redirectedUrl == '/respuesta/list'
    }
}
