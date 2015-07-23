package com.climaescolar



import org.junit.*
import grails.test.mixin.*

@TestFor(JornadaController)
@Mock(Jornada)
class JornadaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/jornada/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.jornadaInstanceList.size() == 0
        assert model.jornadaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.jornadaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.jornadaInstance != null
        assert view == '/jornada/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/jornada/show/1'
        assert controller.flash.message != null
        assert Jornada.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/jornada/list'

        populateValidParams(params)
        def jornada = new Jornada(params)

        assert jornada.save() != null

        params.id = jornada.id

        def model = controller.show()

        assert model.jornadaInstance == jornada
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/jornada/list'

        populateValidParams(params)
        def jornada = new Jornada(params)

        assert jornada.save() != null

        params.id = jornada.id

        def model = controller.edit()

        assert model.jornadaInstance == jornada
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/jornada/list'

        response.reset()

        populateValidParams(params)
        def jornada = new Jornada(params)

        assert jornada.save() != null

        // test invalid parameters in update
        params.id = jornada.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/jornada/edit"
        assert model.jornadaInstance != null

        jornada.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/jornada/show/$jornada.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        jornada.clearErrors()

        populateValidParams(params)
        params.id = jornada.id
        params.version = -1
        controller.update()

        assert view == "/jornada/edit"
        assert model.jornadaInstance != null
        assert model.jornadaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/jornada/list'

        response.reset()

        populateValidParams(params)
        def jornada = new Jornada(params)

        assert jornada.save() != null
        assert Jornada.count() == 1

        params.id = jornada.id

        controller.delete()

        assert Jornada.count() == 0
        assert Jornada.get(jornada.id) == null
        assert response.redirectedUrl == '/jornada/list'
    }
}
