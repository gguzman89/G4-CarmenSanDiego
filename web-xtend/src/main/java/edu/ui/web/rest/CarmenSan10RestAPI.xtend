package edu.ui.web.rest

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType
import edu.ui.domain.Dummy.CarmenSan10Dummy
import org.uqbar.xtrest.api.annotation.Delete
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.commons.model.UserException
import com.fasterxml.jackson.databind.exc.UnrecognizedPropertyException
import edu.ui.domain.CarmenSan10.Villano
import edu.ui.dominioXTrest.ExpedienteRest
import edu.ui.dominioXTrest.MapamundiRest
import org.uqbar.xtrest.api.annotation.Put

@Controller
class CarmenSan10RestAPI {
	extension JSONUtils = new JSONUtils
	
	CarmenSan10Dummy carmenSan10
	
	new (CarmenSan10Dummy dummy) 
	{
		carmenSan10 = dummy
	}
	
	/**
	 * paises - devuelve todos los paises
	 */
	@Get("/paises")
	def getPaises() {
		response.contentType = ContentType.APPLICATION_JSON
		val mapamundi = new MapamundiRest(carmenSan10.mapamundi.paises)
		ok(mapamundi.minificador.toJson)
	}
	
	
	/**
	 * pais - devuelve los datos del país 
	 */
	@Get("/paises/:id")
	def getLibroById() {
		response.contentType = ContentType.APPLICATION_JSON
		
		var pais = carmenSan10.mapamundi.getPais(Integer.valueOf(id))
		val mapamundi = new MapamundiRest(carmenSan10.mapamundi.paises)
		val resConexiones = mapamundi.minificador(pais.paisesConexionAerea)
		
		var pais_mini = mapamundi.miniPais(pais, resConexiones)
		
		if(pais_mini === null) {
			notFound("no se existe el pais con ese ID")
		}else {
			ok(pais_mini.toJson)
		}
	}
	
	
//	@Get("/pais/:id")
//	def deletePaisById() {
//		ok
//	}
	
	
	/**
	 * villanos - devuelve todos los villanos
	 */
	@Get("/villanos")
	def getVillanos() {
		response.contentType = ContentType.APPLICATION_JSON
		val expedientes = new ExpedienteRest(carmenSan10.expediente.villanos)
		ok(expedientes.minificador.toJson)
	}
	
	/**
     * Permite obtener un villano por su id.
     * 
     * Atiende requests de la forma GET /villanos/17.
     */
    @Get("/villano/:id")
    def getVillanosById() {
        response.contentType = ContentType.APPLICATION_JSON
        try {        	
            var villano = carmenSan10.expediente.obtenerVillanoDeId(Integer.valueOf(id))
            if (villano.equals(null)) 
            {
            	notFound(messageToJson("No existe un villano con ese id"))
            } 
            else 
            {
            	ok(villano.toJson)
            }
        }
        catch (NumberFormatException ex) 
        {
        	badRequest(messageToJson("El id debe ser un numero entero"))
        }
    }
    
    /**
     * Permite eliminar un villano por su id.
     * 
     * Atiende requests de la forma DELETE /villanos/7.
     */
    @Delete('/villanos/:id')
    def borrarVillano() {
        response.contentType = ContentType.APPLICATION_JSON
        try {
        	var villano = carmenSan10.expediente.obtenerVillanoDeId(Integer.valueOf(id))
        	if (villano.equals(null))
        	{
        		notFound(messageToJson("No existe un villano con ese id"))
        	}
        	else
        	{
        		carmenSan10.expediente.eliminarVillanoDeId(Integer.valueOf(id))
        		ok()
        	}
        }
        catch (NumberFormatException ex) {
        	badRequest(messageToJson("El id debe ser un numero entero"))
        }
    }
    
     /**
     * Permite crear un villano.
     * 
     * Atiende requests de la forma POST /villanos con un villano en el body (en formato JSON).
     */
    @Post("/villano")
    def crearVillano(@Body String body) {
        response.contentType = ContentType.APPLICATION_JSON
        try {
	        val Villano villano = body.fromJson(Villano)
	        try 
	        {
				carmenSan10.expediente.agregarVillanoNuevo(villano)
				ok('{"id":' + ' "carmenSan10.expediente.idDelVillano(villano.nombre)" }')
	        }
	        catch (UserException exception) {
	        	badRequest(messageToJson(exception.message))
	        }
        } 
        catch (UnrecognizedPropertyException exception) {
        	badRequest(messageToJson("El body debe ser un Villano"))
        }
    }
    
     /**
     * Permite editar un villano.
     * 
     * Atiende requests de la forma POST /villanos/2 con un villano en el body (en formato JSON).
     */
    @Put("/villano/:id")
    def modificarVillano(@Body String body) 
    {
        response.contentType = ContentType.APPLICATION_JSON
        try {
	        val Villano villano = body.fromJson(Villano) // villano nuevo
	        val Integer idV = Integer.valueOf(id) // id del villano a modificar
	        try 
	        {
				carmenSan10.expediente.editarVillano(villano, idV)
				ok(messageToJson("Villano actualizado correctamente"))
	        }
	        catch (UserException exception) 
	        {
	        	badRequest(messageToJson(exception.message))
	        }
        } 
        catch (UnrecognizedPropertyException exception) {
        	badRequest(messageToJson("El body debe ser un Villano"))
        }
    }
    
    private def messageToJson(String message) 
    {
        '{ "error": "' + message + '" }'
    }
}