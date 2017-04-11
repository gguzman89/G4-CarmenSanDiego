package edu.ui.view.runnable;

<<<<<<< HEAD
import edu.ui.view.CarmenSan10.MenuDeAccionesWindow;
=======
import edu.ui.domain.CarmenSan10.Pais;
import edu.ui.view.CarmenSan10.EditarPaisWindows;
>>>>>>> 6e0ab7dcaaf895e70a1af6af740536f6b15bfa85
import org.uqbar.arena.Application;
import org.uqbar.arena.windows.Window;

@SuppressWarnings("all")
public class CarmenApplication extends Application {
  public Window<?> createMainWindow() {
<<<<<<< HEAD
    return new MenuDeAccionesWindow(this);
=======
    Pais _pais = new Pais();
    return new EditarPaisWindows(this, _pais);
>>>>>>> 6e0ab7dcaaf895e70a1af6af740536f6b15bfa85
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
