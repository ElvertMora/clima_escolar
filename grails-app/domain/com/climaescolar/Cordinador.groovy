package com.climaescolar
class Cordinador extends User {

        String      identificacion
        String      nombres
        String      apellidos 
        String      genero
        String      email

	static constraints = {
                        
                identificacion(nullable:false,blank: false, unique: true)         
                nombres (matches: /^[a-zA-Z][ a-zA-Z]*$/)
                apellidos ( matches: /^[a-zA-Z][ a-zA-Z]*$/)     
                genero ( inList:["M","F"])
                email (email: true )
	}
    def afterInsert() {
        def rol = Role.findByAuthority('ROLE_CORDINADOR')
        UserRole.create(this, rol)
    }
}
