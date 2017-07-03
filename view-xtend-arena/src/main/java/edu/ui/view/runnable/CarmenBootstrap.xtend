//package edu.ui.view.runnable
//
//import org.uqbar.arena.bootstrap.CollectionBasedBootstrap
//import org.uqbar.commons.utils.ApplicationContext
//import edu.ui.domain.Repo.RepoMapamundi
//import edu.ui.domain.CarmenSan10.Pais
//import edu.ui.domain.CarmenSan10.Villano
//import edu.ui.domain.Repo.RepoVillanos
//import edu.ui.domain.CarmenSan10.LugarDeInteres
//import edu.ui.domain.CarmenSan10.Caracteristicas
//
//class CarmenBootstrap extends CollectionBasedBootstrap{
//	
//	new() {
//		ApplicationContext.instance.configureSingleton(typeof(Pais), new RepoMapamundi)
//		ApplicationContext.instance.configureSingleton(typeof(Villano), new RepoVillanos)
//	}
//	
//	override run() {
//		val repoMapamundi = ApplicationContext.instance.getSingleton(typeof(Pais)) as RepoMapamundi
//		val repoVillanos = ApplicationContext.instance.getSingleton(typeof(Villano)) as RepoVillanos
//		
//		val lugar1 = LugarDeInteres.BANCO
//		val lugar11 = LugarDeInteres.BIBLIOTECA
//		val lugar12 = LugarDeInteres.CLUB
//		
//		val lugar2 = LugarDeInteres.BIBLIOTECA
//		val lugar21 = LugarDeInteres.BANCO
//		val lugar22 = LugarDeInteres.CLUB
//		
//		val feature1 = new Caracteristicas => [
//			nombre = "bandera amarillo y verde"
//		]
//		
//		val feature2 = new Caracteristicas => [
//			nombre = "bandera azul y blanca"
//		]
//		
//		val feature3 = new Caracteristicas => [
//			nombre = "bandera blanco con un punto rojo"
//		]
//		
//		val cArgentina = repoMapamundi.create("Venezuela",
//											  #[feature1],
//											  #[lugar1, lugar11, lugar12],
//											  #[])
//		
//		repoMapamundi => [
//			create("Argentina", 
//				  #[feature2],
//				  #[lugar1, lugar2, lugar12],
//				  #[cArgentina])
//				  
//			create("Japon", 
//				  #[feature3],
//				  #[lugar2, lugar21, lugar22], 
//				  #[cArgentina]	)
//		]
//		
//		val villaFeature = new Caracteristicas => [
//			nombre = "guiño de ojo"
//		]
//		
//		val villaFeature2 = new Caracteristicas => [
//			nombre = "escuchar musica"
//		]
//		
//		repoVillanos.create("Lorenzo", "masculino", 
//							#[villaFeature],
//							#[villaFeature2])
//							
//		
//	}
//}