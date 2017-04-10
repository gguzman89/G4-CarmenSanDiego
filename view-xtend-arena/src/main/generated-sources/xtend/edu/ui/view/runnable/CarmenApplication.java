package edu.ui.view.runnable;

import edu.ui.domain.CarmenSan10.Mapamundi;
import edu.ui.view.CarmenSan10.MapamundiWindow;
import org.uqbar.arena.Application;
import org.uqbar.arena.windows.Window;

@SuppressWarnings("all")
public class CarmenApplication extends Application {
  public Window<?> createMainWindow() {
    Mapamundi _mapamundi = new Mapamundi();
    return new MapamundiWindow(this, _mapamundi);
  }
  
  /**
   * cada ves que quieran probar su(s) ventana(s) vengan y cambien aqui
   * tanto en el createMainWindow como en main y denle run en .star
   */
  public static void main(final String[] args) {
    CarmenApplication _carmenApplication = new CarmenApplication();
    _carmenApplication.start();
  }
}
