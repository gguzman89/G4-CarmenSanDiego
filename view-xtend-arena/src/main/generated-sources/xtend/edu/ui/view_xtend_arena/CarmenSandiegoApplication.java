package edu.ui.view_xtend_arena;

import edu.ui.domain.CarmenSan10.ACME;
import edu.ui.view_xtend_arena.CarmenSandiegoWindow;
import org.uqbar.arena.Application;
import org.uqbar.arena.windows.Window;

@SuppressWarnings("all")
public class CarmenSandiegoApplication extends Application {
  protected Window<?> createMainWindow() {
    ACME _aCME = new ACME();
    return new CarmenSandiegoWindow(this, _aCME);
  }
  
  public static void main(final String[] args) {
    new CarmenSandiegoApplication().start();
  }
}
