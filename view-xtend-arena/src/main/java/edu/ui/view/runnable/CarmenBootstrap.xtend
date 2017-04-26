package edu.ui.view.runnable

import org.uqbar.arena.bootstrap.CollectionBasedBootstrap
import org.uqbar.commons.utils.ApplicationContext
import edu.ui.domain.Repo.RepoMapamundi
import edu.ui.domain.CarmenSan10.Pais
import edu.ui.domain.CarmenSan10.Embajada
import edu.ui.domain.CarmenSan10.Villano
import edu.ui.domain.Repo.RepoVillanos
import edu.ui.domain.CarmenSan10.Biblioteca
import edu.ui.domain.CarmenSan10.LugarDeInteres

class CarmenBootstrap extends CollectionBasedBootstrap{
	
	new() {
		ApplicationContext.instance.configureSingleton(typeof(Pais), new RepoMapamundi)
		ApplicationContext.instance.configureSingleton(typeof(Villano), new RepoVillanos)
	}
	
	override run() {
		val repoMapamundi = ApplicationContext.instance.getSingleton(typeof(Pais)) as RepoMapamundi
		val repoVillanos = ApplicationContext.instance.getSingleton(typeof(Villano)) as RepoVillanos
		
//		val lugarI = new Embajada => [
//			nombre = "Embajada"
//			politicaDelLugar = "el delicuente me guiño el ojo"
//		]
		
		val lugar1 = LugarDeInteres.BANCO
		
		val lugar2 = LugarDeInteres.BIBLIOTECA
		
		
//		val lugarB = new Biblioteca => [
//			nombre = "Biblioteca"
//			politicaDelLugar = "el delicuente me guiño el ojo"
//		]
		
//		val lugarZ = new Embajada => [
//			politicaDelLugar = "recuerdo que tenia una barba muy larga"
//		]
		
		val cArgentina = repoMapamundi.create("Venezuela",
											  #["bandera amarillo y verde"],
											  #[lugar1],
											  #[])
		
		
		////////////////////////////////////////////////////////////////////////////////////////////
		
		repoVillanos.create("Lorenzo", "masculino", 
							#["guiño de ojo"],
							#["escuchar musica"])
							
		repoMapamundi => [
			create("Argentina", 
				  #["bandera azul y blanca"],
				  #[lugar1, lugar2],
				  #[cArgentina])
				  
			create("Japon", 
				  #["bandera blanco con un punto rojo"],
				  #[lugar2], 
				  #[cArgentina]	)
		]
		
	}
}