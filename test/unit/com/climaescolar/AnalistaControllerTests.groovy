package com.climaescolar



import org.junit.*
import grails.test.mixin.*

@TestFor(AnalistaController)
@Mock(Analista)
class AnalistaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/analista/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.analistaInstanceList.size() == 0
        assert model.analistaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.analistaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.analistaInstance != null
        assert view == '/analista/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/analista/show/1'
        assert controller.flash.message != null
        assert Analista.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/analista/list'

        populateValidParams(params)
        def analista = new Analista(params)

        assert analista.save() != null

        params.id = analista.id

        def model = controller.show()

        assert model.analistaInstance == analista
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/analista/list'

        populateValidParams(params)
        def analista = new Analista(params)

        assert analista.save() != null

        params.id = analista.id

        def model = controller.edit()

        assert model.analistaInstance == analista
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/analista/list'

        response.reset()

        populateValidParams(params)
        def analista = new Analista(params)

        assert analista.save() != null

        // test invalid parameters in update
        params.id = analista.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/analista/edit"
        assert model.analistaInstance != null

        analista.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/analista/show/$analista.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        analista.clearErrors()

        populateValidParams(params)
        params.id = analista.id
        params.version = -1
        controller.update()

        assert view == "/analista/edit"
        assert model.analistaInstance != null
        assert model.analistaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/analista/list'

        response.reset()

        populateValidParams(params)
        def analista = new Analista(params)

        assert analista.save() != null
        assert Analista.count() == 1

        params.id = analista.id

        controller.delete()

        assert Analista.count() == 0
        assert Analista.get(analista.id) == null
        assert response.redirectedUrl == '/analista/list'
    }
}
