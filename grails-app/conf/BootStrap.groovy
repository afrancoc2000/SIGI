import com.sigi.*

class BootStrap {

    def init = { servletContext ->
		if(!Rol.findByAuthority('ROL_ADMIN')) def adminRol = new Rol(authority: 'ROL_ADMIN').save(flush: true)
		if(!Rol.findByAuthority('ROL_USER')) def userRol = new Rol(authority: 'ROL_USER').save(flush: true)

		if(!Usuario.findByUsername('admin')){
			def user = new Usuario(
				username: 'admin',
				password: 'ana.franco.43159262',
			)			
			
	  		user.save(flush: true, failOnError: true)
			UsuarioRol.create(user, Rol.findByAuthority('ROL_ADMIN'), true)
	  
			assert Usuario.count() == 1
			assert Rol.count() == 2
			assert UsuarioRol.count() == 1
		}
    }

    def destroy = {
    }
}
