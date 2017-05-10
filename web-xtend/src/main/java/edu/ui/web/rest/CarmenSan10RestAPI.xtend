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
import edu.ui.domain.Exceptions.VillanoIncompletoException
import edu.ui.domain.Exceptions.ElVillanoYaEstaCargadoException

@Controller
class CarmenSan10RestAPI {
	extension JSONUtils = new JSONUtils
	
	CarmenSan10Dummy carmenSan10
	
	new (CarmenSan10Dummy dummy) {
		carmenSan10 = dummy
	}
	
	
	/**
	 * paises - devuelve todos los paises
	 */
	@Get("/paises")
	def getPaises() {
		response.contentType = ContentType.APPLICATION_JSON
		ok(carmenSan10.mapamundi.paisesMini.toJson)
	}
	
//	@Get("/paises/:id")
//	def getLibroById() {
//		response.contentType = ContentType.APPLICATION_JSON
//		
//		var pais = carmenSan10.getPais(Integer.valueOf(id))
//		if(pais == null) {
//			notFound("no se existe el pais con ese ID")
//		}else {
//			ok(pais.toJson)
//		}
//	}
	
	/**
	 * villanos - devuelve todos los villanos
	 */
	@Get("/villanos")
	def getVillanos() {
		response.contentType = ContentType.APPLICATION_JSON
		ok(carmenSan10.expediente.toJson)
	}
	
	/**
     * Permite obtener un villano por su id.
     * 
     * Atiende requests de la forma GET /villanos/17.
     */
    @Get("/villanos/:id")
    def getVillanosById() {
        response.contentType = ContentType.APPLICATION_JSON
        try {        	
            var villano = carmenSan10.expediente.obtenerVillanoDeId(Integer.valueOf(id))
            if (villano === null) 
            {
            	notFound("No existe un villano con ese id")
            } 
            else 
            {
            	ok(villano.toJson)
            }
        }
        catch (NumberFormatException ex) 
        {
        	badRequest(errorToJson("El id debe ser un numero entero"))
        }
    }
    
    /**
     * Permite eliminar un villano por su id.
     * 
     * Atiende requests de la forma DELETE /villanos/7.
     */
    @Delete('/villanos/:id')
    def deleteVillanoById() {
        response.contentType = ContentType.APPLICATION_JSON
        try {
        	var villano = carmenSan10.expediente.obtenerVillanoDeId(Integer.valueOf(id))
        	if (villano === null)
        	{
        		notFound("No existe un villano con ese id")
        	}
        	else
        	{
        		carmenSan10.expediente.eliminarVillanoDeId(Integer.valueOf(id))
        		ok()
        	}
        }
        catch (NumberFormatException ex) {
        	badRequest(errorToJson("El id debe ser un numero entero"))
        }
    }
    
     /**
     * Permite crear o modificar un villano.
     * 
     * Atiende requests de la forma POST /villanos con un villano en el body (en formato JSON).
     */
    @Post("/villanos")
    def createLibro(@Body String body) {
        response.contentType = ContentType.APPLICATION_JSON
        try {
	        val Villano villano = body.fromJson(Villano)
	        try 
	        {
				carmenSan10.expediente.editarVillano(villano)
				ok()	        	
	        }
	        catch (UserException exception) {
	        	badRequest(errorToJson(exception.message))
	        }
        } 
        catch (UnrecognizedPropertyException exception) {
        	badRequest(errorToJson("El body debe ser un Villano"))
        }
    }
    
    private def errorToJson(String message) 
    {
        '{ "error": "' + message + '" }'
    }
}