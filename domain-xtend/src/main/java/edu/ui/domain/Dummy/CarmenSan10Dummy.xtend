package edu.ui.domain.Dummy

import edu.ui.domain.CarmenSan10.Villano
import edu.ui.domain.CarmenSan10.Caracteristicas
import java.util.ArrayList
import edu.ui.domain.CarmenSan10.Mapamundi
import edu.ui.domain.CarmenSan10.Expediente
import org.eclipse.xtend.lib.annotations.Accessors
import edu.ui.domain.CarmenSan10.PaisSimple
import edu.ui.domain.CarmenSan10.PaisConId
import edu.ui.domain.CarmenSan10.LugarDeInteres

@Accessors
class CarmenSan10Dummy 
{
	Mapamundi mapamundi
	Expediente expediente
	
	new ()
	{	
		mapamundi = new Mapamundi // y nose si es necesario el tener una propiedad Mapamundi
		
		var venezuela = new PaisSimple(1, "Venezuela") 
		
		mapamundi.setPaisMini(venezuela)
		mapamundi.setPaisMini(new PaisSimple(6, "Brazil"))
		mapamundi.setPaisMini(new PaisSimple(7, "Argentina"))
		
		mapamundi.setPaisMini(new PaisConId("Chile", 9, 
											#[LugarDeInteres.BANCO], // xq muestra 3 y en el model 4? 
																	 // y ademas muestra 2 listas...
											#[new PaisSimple(3, "Rumania")]	))
											// xq no me deja agregar a venezuela?
		
		val seniasParticularesCS = new ArrayList<Caracteristicas>()
		val seniaCS1 = new Caracteristicas("Pelo rojo")
		val seniaCS2 = new Caracteristicas("Maneja un convertible")
		seniasParticularesCS.add(seniaCS1)
		seniasParticularesCS.add(seniaCS2)
		
		val hobbiesCS = new ArrayList<Caracteristicas>()
		val hobbieCS = new Caracteristicas("Juega tenis")
		hobbiesCS.add(hobbieCS)
		
		val villanoCS = new Villano("Carmen Sandiego", "Femenino", seniasParticularesCS, hobbiesCS) => [
			id = 3
		]
		
		val seniasParticularesII = new ArrayList<Caracteristicas>()
		val seniaII1 = new Caracteristicas("Pelo rubio")
		val seniaII2 = new Caracteristicas("Maneja un descapotable")
		seniasParticularesII.add(seniaII1)
		seniasParticularesII.add(seniaII2)
		
		val hobbiesII = new ArrayList<Caracteristicas>()
		val hobbieII = new Caracteristicas("Juega tenis")
		hobbiesII.add(hobbieII)
		
		val villanoII = new Villano("Ivan Igorovich", "Masculino", seniasParticularesII, hobbiesII) => [
			id = 2
		]
		
		val villanosDummy = new ArrayList<Villano>()
		villanosDummy.add(villanoCS)
		villanosDummy.add(villanoII)
		
		expediente = new Expediente => [
			villanos = villanosDummy
		]
		
	}
	
	def getPais(int identi) {
		mapamundi.paisesMini.findFirst[ id == identi]
	}
	
}