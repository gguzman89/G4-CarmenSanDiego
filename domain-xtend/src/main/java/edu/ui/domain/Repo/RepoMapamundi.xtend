package edu.ui.domain.Repo

import org.uqbar.commons.model.CollectionBasedRepo
import edu.ui.domain.CarmenSan10.Pais
import org.uqbar.commons.utils.Observable
import org.apache.commons.collections15.Predicate
import edu.ui.domain.CarmenSan10.LugarInteres
import java.util.List

@Observable
class RepoMapamundi extends CollectionBasedRepo<Pais>{
	
	/**
	 *  Altas y bajas
	 */
	 
	 def void create(String pNombre, List<String> pFeature, List<LugarInteres> pLugar, List<Pais> pConection) {
	 	this.create(new Pais => [
	 		nombrePais = pNombre
	 		caracteristicaPais = pFeature
	 		lugares = pLugar
	 		paisesConexionAerea = pConection
	 	])
	 }
	
	override def getEntityType() {
		typeof(Pais)
	}
	
	override def createExample() {
		new Pais()
	}
	
	override def Predicate<Pais> getCriterio(Pais arg0) {
		null
	}
	
}