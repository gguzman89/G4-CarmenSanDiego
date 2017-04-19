package edu.ui.view.runnable

import org.uqbar.arena.bootstrap.CollectionBasedBootstrap
import org.uqbar.commons.utils.ApplicationContext
import edu.ui.domain.CarmenSan10.Mapamundi
import edu.ui.domain.Repo.RepoMapamundi
import edu.ui.domain.CarmenSan10.Pais
import edu.ui.domain.CarmenSan10.Embajada

class CarmenBootstrap extends CollectionBasedBootstrap{
	
	new() {
		ApplicationContext.instance.configureSingleton(typeof(Mapamundi), new RepoMapamundi)
	}
	
	override run() {
		val repoMapamundi = ApplicationContext.instance.getSingleton(typeof(Mapamundi)) as RepoMapamundi
		
		val lugarI = new Embajada
		val cArgentina = new Pais("Venezuela")
		
		repoMapamundi => [
			create("Argentina", 
				  #["bandera azul y blanca"],
				  #[lugarI],
				  #[cArgentina]
				  )
		]
	}
}