package edu.ui.view.runnable

import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window
import edu.ui.view.CarmenSan10.MenuDeAccionesWindow
import edu.ui.domain.Dummy.CarmenSan10Dummy

class CarmenApplication extends Application{
	
	CarmenSan10Dummy dummy = new CarmenSan10Dummy()
	
	override Window<?> createMainWindow() {
		new MenuDeAccionesWindow(this, dummy)
	}
 	
	/**
	 * cada ves que quieran probar su(s) ventana(s) vengan y cambien aqui
	 * tanto en el createMainWindow como en main y denle run en .star
	 * 
	 */
	
	def static main(String[] args) {
		new CarmenApplication().start()
	}
	
}