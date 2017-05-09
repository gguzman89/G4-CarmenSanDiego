package edu.ui.web.app;

import edu.ui.web.rest.CarmenSan10RestAPI;
import org.uqbar.xtrest.api.XTRest;

@SuppressWarnings("all")
public class CarmanSan10App {
  public static void main(final String[] args) {
    CarmenSan10RestAPI _carmenSan10RestAPI = new CarmenSan10RestAPI();
    XTRest.startInstance(_carmenSan10RestAPI, 9000);
  }
}
