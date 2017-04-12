package edu.ui.view.CarmenSan10;

import edu.ui.domain.CarmenSan10.Caso;
import edu.ui.domain.CarmenSan10.Detective;
import edu.ui.view.CarmenSan10.DialogWindow;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.windows.SimpleWindow;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.lacar.ui.model.Action;

@SuppressWarnings("all")
public class InicioDelJuegoWindow extends SimpleWindow<Caso> {
  public InicioDelJuegoWindow(final WindowOwner parent, final Caso model) {
    super(parent, model);
    this.setTitle("Robo del Faraón");
  }
  
  public void createFormPanel(final Panel mainPanel) {
    final Panel labelPanel = new Panel(mainPanel);
    Label _label = new Label(labelPanel);
    _label.setText("Detective, tenemos un caso para usted!");
  }
  
  public void addActions(final Panel actionsPanel) {
    Button _button = new Button(actionsPanel);
    final Procedure1<Button> _function = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Aceptar el caso");
        final Action _function = new Action() {
          public void execute() {
            InicioDelJuegoWindow.this.resolverMisterio();
          }
        };
        it.onClick(_function);
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
  }
  
  public void resolverMisterio() {
    Detective _detective = new Detective();
    DialogWindow _dialogWindow = new DialogWindow(this, _detective);
    _dialogWindow.open();
  }
}
