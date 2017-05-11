package edu.ui.domain.Dummy

import edu.ui.domain.CarmenSan10.Villano
import edu.ui.domain.CarmenSan10.Caracteristicas
import java.util.ArrayList
import edu.ui.domain.CarmenSan10.Mapamundi
import edu.ui.domain.CarmenSan10.Expediente
import org.eclipse.xtend.lib.annotations.Accessors
import edu.ui.domain.CarmenSan10.Pais

@Accessors
class CarmenSan10Dummy 
{
	Mapamundi mapamundi
	Expediente expediente
	
	new ()
	{	
		mapamundi = new Mapamundi // y nose si es necesario el tener una propiedad Mapamundi
		
		var venezuela = new Pais("Venezuela") 
		
		mapamundi.setPaisMini(venezuela)
		mapamundi.setPaisMini(new Pais("Brazil"))
		mapamundi.setPaisMini(new Pais("Argentina"))
		
//		mapamundi.setPaisMini(new Pais("Chile", 9, 
//											#[LugarDeInteres.BANCO], 
//											#[new PaisSimple(3, "Rumania")]	))
											// xq no me deja agregar a venezuela?
		
		//VILLANOS
		
		val seniasParticularesCS = new ArrayList<Caracteristicas>()
		val seniaCS1 = new Caracteristicas("Pelo rojo")
		val seniaCS2 = new Caracteristicas("Maneja un convertible")
		seniasParticularesCS.add(seniaCS1)
		seniasParticularesCS.add(seniaCS2)
		
		val hobbiesCS = new ArrayList<Caracteristicas>()
		val hobbieCS = new Caracteristicas("Juega tenis")
		hobbiesCS.add(hobbieCS)
		
		val villanoCS = new Villano("Carmen Sandiego", "Femenino", seniasParticularesCS, hobbiesCS)
		
		val seniasParticularesII = new ArrayList<Caracteristicas>()
		val seniaII1 = new Caracteristicas("Pelo rubio")
		val seniaII2 = new Caracteristicas("Maneja un descapotable")
		seniasParticularesII.add(seniaII1)
		seniasParticularesII.add(seniaII2)
		
		val hobbiesII = new ArrayList<Caracteristicas>()
		val hobbieII = new Caracteristicas("Juega tenis")
		hobbiesII.add(hobbieII)
		
		val villanoII = new Villano("Ivan Igorovich", "Masculino", seniasParticularesII, hobbiesII)
		
		expediente = new Expediente
		expediente.agregarVillano(villanoCS)
		expediente.agregarVillano(villanoII)
		
	}
	
	
	
}