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
		
		if(Clima.count() == 0){

            for(int i = 0; i < 30; i++ ){

                double radio = 0.05 * Math.random()
                double angulo = 2 * Math.PI * Math.random()

                def clima = new Clima(
                        latitud: 6.2 + radio * Math.sin(angulo),
                        longitud: -75.57  + radio * Math.cos(angulo),
                        tipo: Clima.TipoClima.TEMPERATURA,
                        valor: 100 * Math.random()
                )
                clima.save(flush: true, failOnError: true)

                radio = 0.05 * Math.random()
                angulo = 2 * Math.PI * Math.random()

                clima = new Clima(
                        latitud: 6.2 + radio * Math.sin(angulo),
                        longitud: -75.57  + radio * Math.cos(angulo),
                        tipo: Clima.TipoClima.LLUVIA,
                        valor: 100 * Math.random()
                )
                clima.save(flush: true, failOnError: true)

                radio = 0.05 * Math.random()
                angulo = 2 * Math.PI * Math.random()

                clima = new Clima(
                        latitud: 6.2 + radio * Math.sin(angulo),
                        longitud: -75.57  + radio * Math.cos(angulo),
                        tipo: Clima.TipoClima.CONTAMINACION,
                        valor: 100 * Math.random()
                )
                clima.save(flush: true, failOnError: true)
            }

		}
    }

    def destroy = {
    }
}
