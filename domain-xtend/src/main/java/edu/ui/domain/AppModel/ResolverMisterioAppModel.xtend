package edu.ui.domain.AppModel

import edu.ui.domain.CarmenSan10.ACME
import edu.ui.domain.CarmenSan10.Pais
import edu.ui.domain.CarmenSan10.Villano
import edu.ui.domain.CarmenSan10.LugarDeInteres
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class ResolverMisterioAppModel {
	
	ACME acme
	Pais paisSeleccionado
	Villano villanoSeleccionado
	
	new(){}
	
	new(ACME acme)
	{
		this.acme = acme
	}
	
	def getCaso()
	{
		acme.caso
	}
	
	def getDetective()
	{
		acme.resolvedorDeCasos
	}
	
	def getExpediente()
	{
		acme.villanos
	}
	
	def nombrePaisActual()
	{
		getDetective.nombreDelPaisActual
	}
	
	def nombreDelCaso()
	{
		acme.nombreDelCaso
	}
	
	def ordenDeArresto()
	{
		acme.detectiveEnviarOrdenDeArresto
	}
	
	def regresarAlPaisAnterior() 
	{
		acme.detectiveRegresarAlPaisAnterior
	}
	
	def viajar()
	{
		acme.detectiveViajaA(paisSeleccionado)
	}
	
	def LugarDeInteres el1erLugarDeInteres() {
		// devuelve el 1er lugar de interes
	}
	
	def LugarDeInteres el2erLugarDeInteres() 
	{
		//throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def LugarDeInteres el3erLugarDeInteres() 
	{
		//throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def recorridoCriminal()
	{
		var nombrePaises = acme.nombreDeLosVillanos
	}
	
}