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
import edu.ui.dominioXTrest.PaisSinID
import edu.ui.dominioXTrest.EmitirOrdenRequest
import edu.ui.dominioXTrest.ViajeRequest

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
		val mapamundi = new MapamundiRest(carmenSan10.mapamundi.paises) // comparte o calcula?
		ok(mapamundi.minificador.toJson)
	}
	
	
	/**
	 * pais - devuelve los datos del país 
	 */
	@Get("/pais/:id")
	def getLibroById() {
		response.contentType = ContentType.APPLICATION_JSON
		try{
			var pais = carmenSan10.mapamundi.getPais(Integer.valueOf(id))
			val mapamundi = new MapamundiRest(carmenSan10.mapamundi.paises) // puede ser un new() {}???
			val resConexiones = mapamundi.minificador(pais.paisesConexionAerea)
			
			var pais_mini = mapamundi.miniPais(pais, resConexiones)
			// que onda los notFoundo o bad request?
			// tendra algo que ver el .json del ejemplo Biblioteca
			if(pais == null) { //pais_mini == null || 
				notFound("no existe el pais con ese ID")
			} else {
				ok(pais_mini.toJson)
			}
		
		} catch (NumberFormatException ex) {
			badRequest(getErrorJson("El id debe ser un numero entero"))
		}
	}
	
	
	/**
	 * pais - eliminar un pais por su id
	 * Atiende requests de la forma DELETE /paises/4.
	 */
	@Delete("/pais/:id")
	def deletePaisById() {
		response.contentType = ContentType.APPLICATION_JSON
		
		try {
			carmenSan10.mapamundi.eliminarPaisMini(Integer.valueOf(id))
			ok()
		} catch (NumberFormatException exception) {
			badRequest("El id debe ser un numero entero")
		}
	}
	
	
	@Post("/paises")
	def createPais(@Body String body) {
		response.contentType = ContentType.APPLICATION_JSON
		
		val PaisSinID pais = body.fromJson(PaisSinID)
		val mapamundi = new MapamundiRest(carmenSan10.mapamundi.paises)
		var paisMaxi = mapamundi.maximizar(pais, carmenSan10.mapamundi)
		carmenSan10.mapamundi.setPaisMini(paisMaxi)
		
		ok(carmenSan10.mapamundi.getPais(paisMaxi.nombrePais).id.toJson)
	}
	
	
	@Get("/pistaDelLugar")
	def getPistaDelLugarById() {
		ok
	}
	
	
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
            	notFound(getErrorJson("No existe un villano con ese id"))
            } 
            else 
            {
            	ok(villano.toJson)
            }
        }
        catch (NumberFormatException ex) 
        {
        	badRequest(getErrorJson("El id debe ser un numero entero"))
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
        		notFound(getErrorJson("No existe un villano con ese id"))
        	}
        	else
        	{
        		carmenSan10.expediente.eliminarVillanoDeId(Integer.valueOf(id))
        		ok()
        	}
        }
        catch (NumberFormatException ex) {
        	badRequest(getErrorJson("El id debe ser un numero entero"))
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
				ok(carmenSan10.expediente.idDelVillano(villano.nombre).toJson)
	        }
	        catch (UserException exception) {
	        	badRequest(getErrorJson(exception.message))
	        }
        } 
        catch (UnrecognizedPropertyException exception) {
        	badRequest(getErrorJson("El body debe ser un Villano"))
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
				carmenSan10.expediente.editarVillanoSiPuede(villano, idV)
				ok("Villano actualizado correctamente".toJson)
	        }
	        catch (UserException exception) 
	        {
	        	badRequest(getErrorJson(exception.message))
	        }
        } 
        catch (UnrecognizedPropertyException exception) {
        	badRequest(getErrorJson("El body debe ser un Villano"))
        }
    }
    
     /**
     * Permite emitir una orden de arresto.
     * 
     * Atiende requests de la forma POST /emitirOrdenPara con un EmitirOrdenRequest en el body (en formato JSON).
     */
    @Post("/emitirOrdenPara")
    def emitirOrdenRequest(@Body String body) {
        response.contentType = ContentType.APPLICATION_JSON
        try {
	        val EmitirOrdenRequest ordenDeArresto = body.fromJson(EmitirOrdenRequest)
	        try 
	        {
				//carmenSan10.caso.generarOrdenDeArresto(ordenDeArresto)
				ok("Orden emitida correctamente")
	        }
	        catch (UserException exception) {
	        	badRequest(getErrorJson(exception.message))
	        }
        } 
        catch (UnrecognizedPropertyException exception) {
        	badRequest(getErrorJson("El body debe ser un EmitirOrdenRequest"))
        }
    }
    
    /**
     * Permite viajar una a otro pais.
     * 
     * Atiende requests de la forma POST /viajar con un ViajeRequest en el body (en formato JSON).
     */
    @Post("/viajar")
    def viajar(@Body String body) 
    {
        response.contentType = ContentType.APPLICATION_JSON
        try {
	        val ViajeRequest viaje = body.fromJson(ViajeRequest)
	        try 
	        {
				//carmenSan10.caso.generarOrdenDeArresto(viaje)
				ok("Orden emitida correctamente")
	        }
	        catch (UserException exception) {
	        	badRequest(getErrorJson(exception.message))
	        }
        } 
        catch (UnrecognizedPropertyException exception) {
        	badRequest(getErrorJson("El body debe ser un ViajeRequest"))
        }
    }
    
    
    private def getErrorJson(String message) { // es indiferente
        '{ "error": "' + message + '" }'
    }
}