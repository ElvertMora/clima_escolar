import com.climaescolar.Role
import com.climaescolar.User
import com.climaescolar.UserRole
import com.climaescolar.Localidad
class BootStrap {

    def init = { servletContext ->
        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def userOperario = new Role(authority: 'ROLE_OPERARIO').save(flush: true)
        def userCordinador = new Role(authority: 'ROLE_CORDINADOR').save(flush: true)
        def userAnalista = new Role(authority: 'ROLE_ANALISTA').save(flush: true)
 
        def testUser = new User(username: 'admin', password: 'admin')
        testUser.save(flush: true)

        UserRole.create(testUser,adminRole)
        
        cargarLocalidades()

    }
    def destroy = {
    }
    
    def cargarLocalidades(){
        def localidad1 = new Localidad(id: 1, nombreLocalidad:'USAQUEN').save(flush: true)
        def localidad2 = new Localidad(id: 2, nombreLocalidad:'CHAPINERO').save(flush: true)
        def localidad3 = new Localidad(id: 3, nombreLocalidad:'SANTA FE').save(flush: true)
        def localidad4 = new Localidad(id: 4, nombreLocalidad:'SAN CRISTOBAL').save(flush: true)
        def localidad5 = new Localidad(id: 5, nombreLocalidad:'USME').save(flush: true)
        def localidad6 = new Localidad(id: 6, nombreLocalidad:'TUNJUELITO').save(flush: true)
        def localidad7 = new Localidad(id: 7, nombreLocalidad:'BOSA').save(flush: true)
        def localidad8 = new Localidad(id: 8, nombreLocalidad:'CIUDAD KENNEDY').save(flush: true)
        def localidad9 = new Localidad(id: 9, nombreLocalidad:'FONTIBON').save(flush: true)
        def localidad10 = new Localidad(id: 10, nombreLocalidad:'ENGATIVA').save(flush: true)
        def localidad11 = new Localidad(id: 11, nombreLocalidad:'SUBA').save(flush: true)
        def localidad12 = new Localidad(id: 12, nombreLocalidad:'BARRIOS UNIDOS').save(flush: true)
        def localidad13 = new Localidad(id: 13, nombreLocalidad:'TEUSAQUILLO').save(flush: true)
        def localidad14 = new Localidad(id: 14, nombreLocalidad:'LOS MARTIRES').save(flush: true)
        def localidad15 = new Localidad(id: 15, nombreLocalidad:'ANTONIO NARIÑO').save(flush: true)
        def localidad16 = new Localidad(id: 16, nombreLocalidad:'PUENTE ARANDA').save(flush: true)
        def localidad17 = new Localidad(id: 17, nombreLocalidad:'CANDELARIA').save(flush: true)
        def localidad18 = new Localidad(id: 18, nombreLocalidad:'RAFAEL URIBE').save(flush: true)
        def localidad19 = new Localidad(id: 19, nombreLocalidad:'CIUDAD BOLIVAR').save(flush: true)
        def localidad20 = new Localidad(id: 20, nombreLocalidad:'SUMAPAZ').save(flush: true)
    }
}
