package com.climaescolar



import org.junit.*
import grails.test.mixin.*

@TestFor(OpcionController)
@Mock(Opcion)
class OpcionControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/opcion/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.opcionInstanceList.size() == 0
        assert model.opcionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.opcionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.opcionInstance != null
        assert view == '/opcion/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/opcion/show/1'
        assert controller.flash.message != null
        assert Opcion.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/opcion/list'

        populateValidParams(params)
        def opcion = new Opcion(params)

        assert opcion.save() != null

        params.id = opcion.id

        def model = controller.show()

        assert model.opcionInstance == opcion
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/opcion/list'

        populateValidParams(params)
        def opcion = new Opcion(params)

        assert opcion.save() != null

        params.id = opcion.id

        def model = controller.edit()

        assert model.opcionInstance == opcion
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/opcion/list'

        response.reset()

        populateValidParams(params)
        def opcion = new Opcion(params)

        assert opcion.save() != null

        // test invalid parameters in update
        params.id = opcion.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/opcion/edit"
        assert model.opcionInstance != null

        opcion.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/opcion/show/$opcion.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        opcion.clearErrors()

        populateValidParams(params)
        params.id = opcion.id
        params.version = -1
        controller.update()

        assert view == "/opcion/edit"
        assert model.opcionInstance != null
        assert model.opcionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/opcion/list'

        response.reset()

        populateValidParams(params)
        def opcion = new Opcion(params)

        assert opcion.save() != null
        assert Opcion.count() == 1

        params.id = opcion.id

        controller.delete()

        assert Opcion.count() == 0
        assert Opcion.get(opcion.id) == null
        assert response.redirectedUrl == '/opcion/list'
    }
}
