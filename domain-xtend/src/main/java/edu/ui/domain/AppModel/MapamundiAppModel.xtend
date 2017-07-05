package edu.ui.domain.AppModel

import edu.ui.domain.CarmenSan10.Pais
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.ApplicationContext
import edu.ui.domain.Repo.RepoMapamundi
import java.util.List
import org.uqbar.commons.model.ObservableUtils
import edu.ui.domain.CarmenSan10.Mapamundi

@Accessors
@Observable
class MapamundiAppModel {
	
	Pais itemSeleccionado
	Mapamundi mapa
	
	/**
	 * Todos los application model deben anotarse con @Observable.
	 * También es conveniente que implementen la interfaz Serializable.
	 */
	
	new() {}
	
	new(Mapamundi mapamundi) {
		mapa = mapamundi
	}
	
	def RepoMapamundi getPaisesRepo() 
	{
		ApplicationContext.instance.getSingleton(typeof(Pais))
	}
	
	def List<Pais> getTodosLosPaises(){
		paisesRepo.objects
	}
	
	def void setTodosLosPaises(List<Pais> paises) {}
	
	def getNombreCaracteristicas() {}
	
	def List<Pais> getTodasLasConexiones() {
		itemSeleccionado.paisesConexionAerea
	}
	
	def void setTodasLasConexiones(List<Pais> paises) {}
	
	def List<String> getNombreCoxiones() {
		itemSeleccionado.paisesConexionAerea.map[p| p.nombrePais]
	}
	
	def void setNombreCoxiones(List<String> nombresPaises) {}
	
	def void search() {
		paisesRepo.search(itemSeleccionado.nombrePais)
	}
	
	def String getNombreCaso() {}
	
	def String getNombreVillano() {}
	
	def String getNombrePais() {}
	
	def void getViajar() {}
	
	def String getNombreLugar() {}
	
	def void validacionContinuar() {}
	
	def String getObjetoRobado() {}
	
	def eliminarPaisSeleccionado() {
		
		getPaisesRepo().delete(itemSeleccionado)
		this.search()
		itemSeleccionado = null
		ObservableUtils.firePropertyChanged(this,"todosLosPaises", todosLosPaises)
	}
	
}