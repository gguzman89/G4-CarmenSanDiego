package edu.ui.domain.CarmenSan10

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class LugarInteres {
	// cuando tiene informacion del malechor???
	
	//el lugar de interes deberia saber a que pais pertenece,
	// ya que necesito preguntar si esta el villano en el pais
	Pais perteneceA


	
	Ocupante tipo
	String politicaDelLugar
	// creo que debe conoces en todo momento quien es el villano para dar informacion
	
	new (){}
	
	new(Ocupante cual, String politica) {
		tipo = cual
		politicaDelLugar = politica //new ArrayList<String> ()
	}
	
//	def politicaDelLugar() {
	 	// las pistas/informacion ya vienen cargadas solo creo que hay q saber el tipo de ocupante
	 	// como y donde contemplar las pistas???
	 	
	 	/* yo creo que debe retornar la pista que contenga el lugar, dar o no la pista depende del
	 	 * ocupante, ya que reaccionara de manera diferente si el villano se encuentra o no en el
	 	 * pais, por eso necesito saber a que pais pertenece el lugar, sino no tengo forma de 
	 	 * preguntar si esta el villano en el pais
	 	 * Saludos: Alan
	 	 */
	 	
//	 	tipo.politicaDelLugarSegun(this)
	 	/*no  creo que dependa del ocupante esto. Pongamos un ejemplo a ver si podemos aclararlo 
	 	 * creamos un ocupante, lo asignamos a un banco. Si el villano no esta en el pais, el ocu-
	 	 * pante solo dira que regresemos, sino nos dara una pista de que moneda estuvo intercambian-
	 	 * do. En este caso el ocupante solo sabe la pista de acuerdo al lugar donde este asignado,
	 	 * por lo que la mondeda que intercambio el villano lo sabe el Banco, no el ocupante; sino 
	 	 * el ocupante deberia saber de todo por si lo intercambiamos de lugar, nose por ejemplo lo
	 	 * ponemos en la Biblioteca. En sintesis, para mi el ocupante sabe dar o no la pista y cuando
	 	 * busca la pista debe preguntarla al lugar
	 	 * Saludos: nuevamente yo (Alan) 
	 	 */
//	 }
	
	def Ocupante quienEsta() {
		tipo
	}
}
