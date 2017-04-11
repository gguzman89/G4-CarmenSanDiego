package edu.ui.view_xtend_arena;

import edu.ui.domain.CarmenSan10.ACME;
import edu.ui.view_xtend_arena.CarmenSandiegoApplication;
import edu.ui.view_xtend_arena.DialogWindow;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.windows.SimpleWindow;
import org.uqbar.lacar.ui.model.Action;

@SuppressWarnings("all")
public class CarmenSandiegoWindow extends SimpleWindow<ACME> {
  public CarmenSandiegoWindow(final CarmenSandiegoApplication parent, final ACME model) {
    super(parent, model);
    this.setTitle("¿Dónde está Carmen Sandiego?");
    this.setTaskDescription("");
  }
  
  public void createFormPanel(final Panel mainPanel) {
    final Panel labelPanel = new Panel(mainPanel);
    Label _label = new Label(labelPanel);
    _label.setText("¿Qué haremos ahora detective?");
  }
  
  public void addActions(final Panel actionsPanel) {
    Button _button = new Button(actionsPanel);
    final Procedure1<Button> _function = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Boton de prueba");
        final Action _function = new Action() {
          public void execute() {
            CarmenSandiegoWindow.this.botonDeDialog();
          }
        };
        it.onClick(_function);
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
    Button _button_1 = new Button(actionsPanel);
    final Procedure1<Button> _function_1 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Resolver misterio");
        final Action _function = new Action() {
          public void execute() {
            CarmenSandiegoWindow.this.iniciarJuego();
          }
        };
        it.onClick(_function);
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_1);
    Button _button_2 = new Button(actionsPanel);
    final Procedure1<Button> _function_2 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Mapamundi");
        final Action _function = new Action() {
          public void execute() {
            CarmenSandiegoWindow.this.botonDeDialog();
          }
        };
        it.onClick(_function);
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button_2, _function_2);
    Button _button_3 = new Button(actionsPanel);
    final Procedure1<Button> _function_3 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Expedientes");
        final Action _function = new Action() {
          public void execute() {
            CarmenSandiegoWindow.this.botonDeDialog();
          }
        };
        it.onClick(_function);
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button_3, _function_3);
  }
  
  public void iniciarJuego() {
  }
  
  public void botonDeDialog() {
    final ACME acme = this.getModelObject();
    new DialogWindow(this, acme).open();
  }
}
