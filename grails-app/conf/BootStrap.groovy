import com.climaescolar.Colegio
import com.climaescolar.Colegio.TipoColegio
import com.climaescolar.Jornada
import com.climaescolar.Jornada.TipoJornada
import com.climaescolar.Role
import com.climaescolar.User
import com.climaescolar.UserRole
import com.climaescolar.Localidad


class BootStrap {

	def sessionFactory

	def init = { servletContext ->
		def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
		def userOperario = new Role(authority: 'ROLE_OPERARIO').save(flush: true)
		def userCordinador = new Role(authority: 'ROLE_CORDINADOR').save(flush: true)
		def userAnalista = new Role(authority: 'ROLE_ANALISTA').save(flush: true)

		def testUser = new User(username: 'admin', password: 'admin')
		testUser.save(flush: true)

		UserRole.create(testUser,adminRole)

		cargarLocalidades()
		cargarColegios520(servletContext)
		cargarJornadas520(servletContext)
	}
	def destroy = {
	}

	def cargarLocalidades(){
		if(Localidad.count() == 0) {
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

	def cargarColegios520(servletContext) {
		if(Colegio.count() == 0) {
			def session = sessionFactory.currentSession
			def entity
			def resourcesDir = '/../resources'
			def reader = new File(servletContext.getRealPath("$resourcesDir/colegios520csv.csv")).toCsvMapReader()
			reader.each {
				entity = new Colegio()
				entity.id = Long.valueOf(it.id)
				entity.dane = it.dane
				def str = it.tipoInstitucion
				if(str == "DISTRITAL"){
					entity.tipoInstitucion = TipoColegio.DISTRITAL
				}
				if(str == "DISTRITAL - CONCESION"){
					entity.tipoInstitucion = TipoColegio.DISTRITAL_CONCESION
				}
				if(str == "PRIVADO"){
					entity.tipoInstitucion = TipoColegio.PRIVADO
				}
				if(str == "PRIVADO - CONVENIO"){
					entity.tipoInstitucion = TipoColegio.PRIVADO_CONVENIO
				}
				entity.nombreInstitucion = it.nombre
				entity.direccion = it.direccion
				entity.barrio = it.barrio
				entity.telefono = it.telefono
				entity.email1 = it.email1
				entity.email2 = it.email2
				entity.nombreRector = it.rector
				entity.localidad = Localidad.get(it.localidadId)
				entity.fechaVisita = new Date()
				entity.fechaLlamada = new Date()
				entity.confirmacion = false
				entity.actualizo = ""
				entity.resultado = false
				entity.visitaPrevia = false


				entity.save(validate: false)
			}
		}
	}
	def cargarJornadas520(servletContext) {
		if(Jornada.count() <= 20) {
			def session = sessionFactory.currentSession
			def entity
			def resourcesDir = '/../resources'
			def reader = new File(servletContext.getRealPath("$resourcesDir/jornadas520.csv")).toCsvMapReader()
			reader.each {
				entity = new Jornada()
				System.println(it.colDane)
				System.println(Colegio.findByDane(it.colDane))
				entity.colegio = Colegio.findByDane(it.colDane)
				def str = it.tipo
				if(str == "manana"){
					entity.tipo = TipoJornada.MAÑANA
				}
				if(str == "unica"){
					entity.tipo = TipoJornada.UNICA
				}
				if(str == "tarde"){
					entity.tipo = TipoJornada.TARDE
				}
				entity.sede = it.sede

				entity.save(validate: false)
			}
		}
	}
}
