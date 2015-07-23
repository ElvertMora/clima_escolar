package com.climaescolar



import org.junit.*
import grails.test.mixin.*

@TestFor(OperarioController)
@Mock(Operario)
class OperarioControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/operario/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.operarioInstanceList.size() == 0
        assert model.operarioInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.operarioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.operarioInstance != null
        assert view == '/operario/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/operario/show/1'
        assert controller.flash.message != null
        assert Operario.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/operario/list'

        populateValidParams(params)
        def operario = new Operario(params)

        assert operario.save() != null

        params.id = operario.id

        def model = controller.show()

        assert model.operarioInstance == operario
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/operario/list'

        populateValidParams(params)
        def operario = new Operario(params)

        assert operario.save() != null

        params.id = operario.id

        def model = controller.edit()

        assert model.operarioInstance == operario
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/operario/list'

        response.reset()

        populateValidParams(params)
        def operario = new Operario(params)

        assert operario.save() != null

        // test invalid parameters in update
        params.id = operario.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/operario/edit"
        assert model.operarioInstance != null

        operario.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/operario/show/$operario.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        operario.clearErrors()

        populateValidParams(params)
        params.id = operario.id
        params.version = -1
        controller.update()

        assert view == "/operario/edit"
        assert model.operarioInstance != null
        assert model.operarioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/operario/list'

        response.reset()

        populateValidParams(params)
        def operario = new Operario(params)

        assert operario.save() != null
        assert Operario.count() == 1

        params.id = operario.id

        controller.delete()

        assert Operario.count() == 0
        assert Operario.get(operario.id) == null
        assert response.redirectedUrl == '/operario/list'
    }
}
