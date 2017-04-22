package edu.ui.domain.CarmenSan10

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.TransactionalAndObservable
import org.uqbar.commons.utils.Observable

@Accessors
@TransactionalAndObservable
//@Observable
abstract class LugarInteres {
	
	String nombre
	String politicaDelLugar
	//segun el lugar sabe una pista
	Ocupante tipo
	
	new (){}
	
	new(Ocupante cual) {
		tipo = cual
	}
	
	def preguntarAlOcupante() {
		tipo.responderAlDetective(this)// + adicional() AQUÍ NO VA - Informante
		}
	
	def abstract String adicional()
	
	def getNombreLugares() {
		nombre
	}

}
