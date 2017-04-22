package edu.ui.domain.CarmenSan10

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import edu.ui.domain.Exceptions.YaEstaAgregadaEsaConexion
import org.uqbar.commons.utils.TransactionalAndObservable
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.UserException

@Accessors
@TransactionalAndObservable
class Pais extends Entity implements Cloneable {
	
	String nombrePais
	List<String> caracteristicaPais
	List<LugarInteres> lugares
	List<Pais> paisesConexionAerea
	
	new (){}
	
	new(String nombre) {
		nombrePais = nombre
		caracteristicaPais = new ArrayList<String>()
		lugares = new ArrayList<LugarInteres>()
		paisesConexionAerea = new ArrayList<Pais>()
		
	}
	
//	def List<String> getNombreLugares() {
//		lugares.map[l| l.nombre]
//		//lugares.get(0).nombre
//	}
	
	def void setNombreLugares(List<LugarInteres> plugares) {}
	
	// y todo lo que se pueda jugar con una lista por cada lista
	
	def tieneConexionAereaCon(Pais pais) {
		paisesConexionAerea.exists[p | p.nombrePais == pais.nombrePais]
	}
	
	def agregarConexionesAerea(Pais unPais) {
			paisesConexionAerea.add(unPais)
	}
	
	def agregarConexionSiPuede(Pais unPais) {
		if (! paisesConexionAerea.contains(unPais)) { // Returns true if this list contains the specified element.
			agregarConexionesAerea
		} else {
			throw new YaEstaAgregadaEsaConexion("Tenes un conexion/pais ya definida")
		}
	}
	
	def borrarConexionAerea(Pais unPais) {
		paisesConexionAerea.remove(unPais)
	}
	
	def esElFinalDelRecorrido(List<Pais> recorrido)
	{
		var Pais paisDestino = recorrido.get(recorrido.size - 1)
		this.esIgualA(paisDestino.nombrePais)
	}
	
	def esIgualA(String nombreAComparar) 
	{
		nombrePais == nombreAComparar
	}
	
	def estaDentroDelRecorrido(List<Pais> recorrido)
	{
		recorrido.exists[pais| pais.esIgualA(nombrePais)]
	}
	
	def estaFueraDelRecorrido (List<Pais> recorrido)
	{
		! estaDentroDelRecorrido(recorrido)
	}
	
	def perteneceAlRecorrido(List<Pais> recorrido)
	{
		val recorridoAux = recorrido
		var recorridoSinUltimoPais = recorrido.filter[pais| pais.noEsElUltimoDelRecorrido(recorridoAux)].toList
		estaDentroDelRecorrido(recorridoSinUltimoPais)
	}
	
	def noEsElUltimoDelRecorrido(List<Pais> recorrido) 
	{
		! esElFinalDelRecorrido(recorrido)
	}
	
	def validar() {
		if(nombrePais == null) {
			throw new UserException("El nombre no puede quedar vacion")
		}
		
		if(caracteristicaPais.isEmpty) {
			throw new UserException("Al menos debe tener 1 caracteristica")
		}
		
		if(lugares.size == 3) {
			throw new UserException("Te faltan agregar mas Lugar para visitar")
		}
		
	}
	
	
}