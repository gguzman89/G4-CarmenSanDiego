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
	
	new (){
	}
	
	
	def void establecerOcupante(Pais p, Caso c){
		if (p.estaFueraDelRecorrido(c.planDeEscape)){
			tipo = new Cuidador
		}
		else{
			
		}
	}
	
	
	def preguntarAlOcupante() {
		tipo.responderAlDetective(this)// + adicional() AQUÍ NO VA - Informante
		}
	
	def abstract String adicional()
	
	def getNombreLugares() {
		nombre
	}
	
	def abstract void setPoliticaDelLugar (Caso c, Pais actual)

}
