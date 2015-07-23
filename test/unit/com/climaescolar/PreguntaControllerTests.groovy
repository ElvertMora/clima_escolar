package com.climaescolar



import org.junit.*
import grails.test.mixin.*

@TestFor(PreguntaController)
@Mock(Pregunta)
class PreguntaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/pregunta/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.preguntaInstanceList.size() == 0
        assert model.preguntaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.preguntaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.preguntaInstance != null
        assert view == '/pregunta/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/pregunta/show/1'
        assert controller.flash.message != null
        assert Pregunta.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/pregunta/list'

        populateValidParams(params)
        def pregunta = new Pregunta(params)

        assert pregunta.save() != null

        params.id = pregunta.id

        def model = controller.show()

        assert model.preguntaInstance == pregunta
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/pregunta/list'

        populateValidParams(params)
        def pregunta = new Pregunta(params)

        assert pregunta.save() != null

        params.id = pregunta.id

        def model = controller.edit()

        assert model.preguntaInstance == pregunta
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/pregunta/list'

        response.reset()

        populateValidParams(params)
        def pregunta = new Pregunta(params)

        assert pregunta.save() != null

        // test invalid parameters in update
        params.id = pregunta.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/pregunta/edit"
        assert model.preguntaInstance != null

        pregunta.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/pregunta/show/$pregunta.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        pregunta.clearErrors()

        populateValidParams(params)
        params.id = pregunta.id
        params.version = -1
        controller.update()

        assert view == "/pregunta/edit"
        assert model.preguntaInstance != null
        assert model.preguntaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/pregunta/list'

        response.reset()

        populateValidParams(params)
        def pregunta = new Pregunta(params)

        assert pregunta.save() != null
        assert Pregunta.count() == 1

        params.id = pregunta.id

        controller.delete()

        assert Pregunta.count() == 0
        assert Pregunta.get(pregunta.id) == null
        assert response.redirectedUrl == '/pregunta/list'
    }
}
