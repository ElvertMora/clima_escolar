package com.climaescolar



import org.junit.*
import grails.test.mixin.*

@TestFor(ColegioController)
@Mock(Colegio)
class ColegioControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/colegio/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.colegioInstanceList.size() == 0
        assert model.colegioInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.colegioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.colegioInstance != null
        assert view == '/colegio/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/colegio/show/1'
        assert controller.flash.message != null
        assert Colegio.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/colegio/list'

        populateValidParams(params)
        def colegio = new Colegio(params)

        assert colegio.save() != null

        params.id = colegio.id

        def model = controller.show()

        assert model.colegioInstance == colegio
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/colegio/list'

        populateValidParams(params)
        def colegio = new Colegio(params)

        assert colegio.save() != null

        params.id = colegio.id

        def model = controller.edit()

        assert model.colegioInstance == colegio
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/colegio/list'

        response.reset()

        populateValidParams(params)
        def colegio = new Colegio(params)

        assert colegio.save() != null

        // test invalid parameters in update
        params.id = colegio.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/colegio/edit"
        assert model.colegioInstance != null

        colegio.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/colegio/show/$colegio.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        colegio.clearErrors()

        populateValidParams(params)
        params.id = colegio.id
        params.version = -1
        controller.update()

        assert view == "/colegio/edit"
        assert model.colegioInstance != null
        assert model.colegioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/colegio/list'

        response.reset()

        populateValidParams(params)
        def colegio = new Colegio(params)

        assert colegio.save() != null
        assert Colegio.count() == 1

        params.id = colegio.id

        controller.delete()

        assert Colegio.count() == 0
        assert Colegio.get(colegio.id) == null
        assert response.redirectedUrl == '/colegio/list'
    }
}
