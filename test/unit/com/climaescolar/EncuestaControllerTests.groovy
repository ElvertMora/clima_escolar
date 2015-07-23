package com.climaescolar



import org.junit.*
import grails.test.mixin.*

@TestFor(EncuestaController)
@Mock(Encuesta)
class EncuestaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/encuesta/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.encuestaInstanceList.size() == 0
        assert model.encuestaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.encuestaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.encuestaInstance != null
        assert view == '/encuesta/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/encuesta/show/1'
        assert controller.flash.message != null
        assert Encuesta.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/encuesta/list'

        populateValidParams(params)
        def encuesta = new Encuesta(params)

        assert encuesta.save() != null

        params.id = encuesta.id

        def model = controller.show()

        assert model.encuestaInstance == encuesta
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/encuesta/list'

        populateValidParams(params)
        def encuesta = new Encuesta(params)

        assert encuesta.save() != null

        params.id = encuesta.id

        def model = controller.edit()

        assert model.encuestaInstance == encuesta
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/encuesta/list'

        response.reset()

        populateValidParams(params)
        def encuesta = new Encuesta(params)

        assert encuesta.save() != null

        // test invalid parameters in update
        params.id = encuesta.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/encuesta/edit"
        assert model.encuestaInstance != null

        encuesta.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/encuesta/show/$encuesta.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        encuesta.clearErrors()

        populateValidParams(params)
        params.id = encuesta.id
        params.version = -1
        controller.update()

        assert view == "/encuesta/edit"
        assert model.encuestaInstance != null
        assert model.encuestaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/encuesta/list'

        response.reset()

        populateValidParams(params)
        def encuesta = new Encuesta(params)

        assert encuesta.save() != null
        assert Encuesta.count() == 1

        params.id = encuesta.id

        controller.delete()

        assert Encuesta.count() == 0
        assert Encuesta.get(encuesta.id) == null
        assert response.redirectedUrl == '/encuesta/list'
    }
}
