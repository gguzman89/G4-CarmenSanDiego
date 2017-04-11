package edu.ui.view.runnable;

import edu.ui.view.CarmenSan10.MenuDeAccionesWindow;
import org.uqbar.arena.Application;
import org.uqbar.arena.windows.Window;

@SuppressWarnings("all")
public class CarmenApplication extends Application {
  public Window<?> createMainWindow() {
    return new MenuDeAccionesWindow(this);
  }
  
  /**
   * cada ves que quieran probar su(s) ventana(s) vengan y cambien aqui
   * tanto en el createMainWindow como en main y denle run en .star
   */
  public static void main(final String[] args) {
    new CarmenApplication().start();
  }
}
