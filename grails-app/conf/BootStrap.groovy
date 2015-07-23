import com.climaescolar.Role
import com.climaescolar.User
import com.climaescolar.UserRole
class BootStrap {

    def init = { servletContext ->
        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def userOperario = new Role(authority: 'ROLE_OPERARIO').save(flush: true)
        def userCordinador = new Role(authority: 'ROLE_CORDINADOR').save(flush: true)
        def userAnalista = new Role(authority: 'ROLE_ANALISTA').save(flush: true)
 
        def testUser = new User(username: 'admin', password: 'admin')
        testUser.save(flush: true)

        UserRole.create(testUser,adminRole)

    }
    def destroy = {
    }
}
