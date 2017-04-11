package edu.ui.view.runnable

import org.uqbar.arena.Application
import edu.ui.view.CarmenSan10.MapamundiWindow
import edu.ui.domain.CarmenSan10.Mapamundi
<<<<<<< HEAD
import edu.ui.domain.CarmenSan10.Detective
import edu.ui.view.CarmenSan10.MenuDeAccionesWindow
import org.uqbar.arena.windows.Window
=======
import edu.ui.view.CarmenSan10.EditarPaisWindows
import edu.ui.domain.CarmenSan10.Pais

//import edu.ui.domain.CarmenSan10.Detective
//import edu.ui.view.CarmenSan10.MenuDeAccionesWindow
//import org.uqbar.arena.windows.Window
>>>>>>> 6e0ab7dcaaf895e70a1af6af740536f6b15bfa85

class CarmenApplication extends Application{
	
	override createMainWindow() {
		//new MapamundiWindow(this, new Mapamundi)
<<<<<<< HEAD
		new MenuDeAccionesWindow(this)
=======
		//new MenuDeAccionesWindow(this)
		new EditarPaisWindows(this, new Pais)
>>>>>>> 6e0ab7dcaaf895e70a1af6af740536f6b15bfa85
	}
	
 
	
/*	override protected Window<?> createMainWindow() {
		return new MenuDeAccionesWindow(this)
	}*/
	/**
	 * cada ves que quieran probar su(s) ventana(s) vengan y cambien aqui
	 * tanto en el createMainWindow como en main y denle run en .star
	 * 
	 */
	
	def static main(String[] args) {
		new CarmenApplication().start
	}
	
}