package edu.ui.domain.Dummy

import edu.ui.domain.CarmenSan10.Villano
import edu.ui.domain.CarmenSan10.Caracteristicas
import java.util.ArrayList
import edu.ui.domain.CarmenSan10.Mapamundi
import edu.ui.domain.CarmenSan10.Expediente
import org.eclipse.xtend.lib.annotations.Accessors
import edu.ui.domain.CarmenSan10.Pais
import edu.ui.domain.CarmenSan10.LugarDeInteres

@Accessors
class CarmenSan10Dummy 
{
	Mapamundi mapamundi
	Expediente expediente
	
	new ()
	{
		/**
		 * Mapamundi - Paises
		 */	
		mapamundi = new Mapamundi
		
		// diff entre val y var?
		val venezuela = new Pais() => [
			nombrePais = "Venezuela"
			lugares = #[LugarDeInteres.EMBAJADA, LugarDeInteres.BIBLIOTECA, LugarDeInteres.CLUB]
			paisesConexionAerea = #[]
			caracteristicaPais = #[new Caracteristicas("Maduro a la cabeza")]
		]
		
		val brazil = new Pais() => [
			nombrePais = "Brazil"
			lugares = #[LugarDeInteres.EMBAJADA, LugarDeInteres.BANCO, LugarDeInteres.CLUB]
			paisesConexionAerea = #[venezuela]
			caracteristicaPais = #[new Caracteristicas("Joga bonito")]
		]
		
		val argentina = new Pais() => [
			nombrePais = "Argentina"
			lugares = #[LugarDeInteres.EMBAJADA, LugarDeInteres.BIBLIOTECA, LugarDeInteres.BANCO]
			paisesConexionAerea = #[venezuela, brazil]
			caracteristicaPais = #[new Caracteristicas("Bandera azul y blanca")]
		]
		
		val uruguay = new Pais() => [
			nombrePais = "Uruguay"
			lugares = #[LugarDeInteres.BANCO, LugarDeInteres.BIBLIOTECA, LugarDeInteres.CLUB]
			paisesConexionAerea = #[venezuela, brazil, argentina]
			caracteristicaPais = #[new Caracteristicas("A toda hora mate :D")]
		]
		
		
		mapamundi.setPaisMini(venezuela) // id = 1
		mapamundi.setPaisMini(brazil)	 // id = 2
		mapamundi.setPaisMini(argentina) // id = 3
		mapamundi.setPaisMini(uruguay)	 // id = 4
		
		
		/**
		 * Expediente - Villanos
		 */
		
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