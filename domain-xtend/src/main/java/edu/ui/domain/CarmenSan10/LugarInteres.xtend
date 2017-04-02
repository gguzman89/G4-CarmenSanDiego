package edu.ui.domain.CarmenSan10

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class LugarInteres {
	
	//el lugar de interes deberia saber a que pais pertenece,
	// ya que necesito preguntar si esta el villano en el pais
	Pais perteneceA

	String politicaDelLugar
	//segun el lugar sabre una pista
	
	Ocupante tipo
	
	new (){}
	
	new(Ocupante cual) {
		tipo = cual
	}
	
	def Ocupante quienEsta() {
		tipo
	}

	def preguntarAlOcupante() {
		tipo.responderAlDetective(this)
		/*no  creo que dependa del ocupante esto. Pongamos un ejemplo a ver si podemos aclararlo 
	 	 * creamos un ocupante, lo asignamos a un banco. Si el villano no esta en el pais, el ocu-
	 	 * pante solo dira que regresemos, sino nos dara una pista de que moneda estuvo intercambian-
	 	 * do. En este caso el ocupante solo sabe la pista de acuerdo al lugar donde este asignado,
	 	 * por lo que la mondeda que intercambio el villano lo sabe el Banco, no el ocupante; sino 
	 	 * el ocupante deberia saber de todo por si lo intercambiamos de lugar, nose por ejemplo lo
	 	 * ponemos en la Biblioteca. En sintesis, para mi el ocupante sabe dar o no la pista y cuando
	 	 * busca la pista debe preguntarla al lugar
	 	 * Saludos:  yo (Alan) 
	 	 */
		}
	}
	
	def abstract String adicional()

}
