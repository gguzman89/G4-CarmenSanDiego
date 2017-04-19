package edu.ui.view.runnable

import org.uqbar.arena.Application
import edu.ui.view.CarmenSan10.EditarPaisWindows
import edu.ui.domain.CarmenSan10.Pais
import edu.ui.view.CarmenSan10.MenuDeAccionesWindow
import edu.ui.view.CarmenSan10.MapamundiWindow
import edu.ui.domain.CarmenSan10.Mapamundi
import org.uqbar.arena.windows.Window

class CarmenApplication extends Application{
	
	new(CarmenBootstrap bootstrap) {
		super(bootstrap)
	}
	
	override Window<?> createMainWindow() {
		new MapamundiWindow(this)
	}
 	
	/**
	 * cada ves que quieran probar su(s) ventana(s) vengan y cambien aqui
	 * tanto en el createMainWindow como en main y denle run en .star
	 * 
	 */
	
	def static main(String[] args) {
		new CarmenApplication(new CarmenBootstrap).start()
	}
	
}