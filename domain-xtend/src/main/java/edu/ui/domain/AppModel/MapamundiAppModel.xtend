package edu.ui.domain.AppModel

import edu.ui.domain.CarmenSan10.Pais
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import edu.ui.domain.CarmenSan10.Mapamundi
import org.uqbar.commons.utils.ApplicationContext
import edu.ui.domain.Repo.RepoMapamundi
import java.util.List

@Accessors
@Observable
class MapamundiAppModel {
	
	//Mapamundi mapa
	Pais itemSeleccionado
	RepoMapamundi paisesAMostrar
	
	new()
	{}
	
	def RepoMapamundi getPaisesAMostrar() 
	{
		ApplicationContext.instance.getSingleton(typeof(Pais))
	}
	
	def setPaisesAMostrar(RepoMapamundi paises)
	{
		
	}
//	
//	def paises()
//	{
//		mapa.paises
//	}
//	
	def void search() {
		//aMostrar = repoMapamundi.search(itemSeleccionado.nombrePais)
	}
	
	def caracteristicasPaisSeleccionado () 
	{
		itemSeleccionado.caracteristicaPais
	}
	
	def String getNombreCaso() {
		
	}
	
	def String getNombreVillano() {
	}
	
	def String getNombrePais() {
	}
	
	def void getViajar() {
	}
	
	def String getNombreLugar() {
	}
	
	def void validacionContinuar() {
	}
	
	def String getObjetoRobado() {
	}
	
}