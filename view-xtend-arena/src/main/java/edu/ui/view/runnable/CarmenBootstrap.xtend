package edu.ui.view.runnable

import org.uqbar.arena.bootstrap.CollectionBasedBootstrap
import org.uqbar.commons.utils.ApplicationContext
import edu.ui.domain.CarmenSan10.Mapamundi
import edu.ui.domain.Repo.RepoMapamundi
import edu.ui.domain.CarmenSan10.Pais
import edu.ui.domain.CarmenSan10.Embajada
import edu.ui.domain.CarmenSan10.Villano
import edu.ui.domain.Repo.RepoVillanos

class CarmenBootstrap extends CollectionBasedBootstrap{
	
	new() {
		ApplicationContext.instance.configureSingleton(typeof(Pais), new RepoMapamundi)
		ApplicationContext.instance.configureSingleton(typeof(Villano), new RepoVillanos)
	}
	
	override run() {
		val repoMapamundi = ApplicationContext.instance.getSingleton(typeof(Pais)) as RepoMapamundi
		val repoVillanos = ApplicationContext.instance.getSingleton(typeof(Villano)) as RepoVillanos
		
		val lugarI = new Embajada => [
			politicaDelLugar = "el delicuente me guiño el ojo"
		]
		val cArgentina = new Pais("Venezuela")
		
		
		val lugarZ = new Embajada => [
			politicaDelLugar = "recuerdo que tenia una barba muy larga"
		]
		////////////////////////////////////////////////////////////////////////////////////////////
		
		repoVillanos.create("Lorenzo", "masculino", 
							#["guiño de ojo"],
							#["escuchar musica"], lugarI)
							
		repoMapamundi.create(cArgentina)
							
		repoMapamundi => [
			create("Argentina", 
				  #["bandera azul y blanca"],
				  #[lugarI],
				  #[cArgentina])
//				  
//			create("Japon", 
//				  #["bandera blanco con un punto rojo"],
//				  #[lugarZ], 
//				  #[cArgentina]	)
		]
		
	}
}