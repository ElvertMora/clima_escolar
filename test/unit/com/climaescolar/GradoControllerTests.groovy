package com.climaescolar



import org.junit.*
import grails.test.mixin.*

@TestFor(GradoController)
@Mock(Grado)
class GradoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/grado/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.gradoInstanceList.size() == 0
        assert model.gradoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.gradoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.gradoInstance != null
        assert view == '/grado/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/grado/show/1'
        assert controller.flash.message != null
        assert Grado.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/grado/list'

        populateValidParams(params)
        def grado = new Grado(params)

        assert grado.save() != null

        params.id = grado.id

        def model = controller.show()

        assert model.gradoInstance == grado
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/grado/list'

        populateValidParams(params)
        def grado = new Grado(params)

        assert grado.save() != null

        params.id = grado.id

        def model = controller.edit()

        assert model.gradoInstance == grado
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/grado/list'

        response.reset()

        populateValidParams(params)
        def grado = new Grado(params)

        assert grado.save() != null

        // test invalid parameters in update
        params.id = grado.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/grado/edit"
        assert model.gradoInstance != null

        grado.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/grado/show/$grado.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        grado.clearErrors()

        populateValidParams(params)
        params.id = grado.id
        params.version = -1
        controller.update()

        assert view == "/grado/edit"
        assert model.gradoInstance != null
        assert model.gradoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/grado/list'

        response.reset()

        populateValidParams(params)
        def grado = new Grado(params)

        assert grado.save() != null
        assert Grado.count() == 1

        params.id = grado.id

        controller.delete()

        assert Grado.count() == 0
        assert Grado.get(grado.id) == null
        assert response.redirectedUrl == '/grado/list'
    }
}
