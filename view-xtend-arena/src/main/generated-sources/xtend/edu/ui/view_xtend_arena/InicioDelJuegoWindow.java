package edu.ui.view_xtend_arena;

import edu.ui.domain.CarmenSan10.Caso;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.windows.SimpleWindow;
import org.uqbar.arena.windows.WindowOwner;

@SuppressWarnings("all")
public class InicioDelJuegoWindow extends SimpleWindow<Caso> {
  public InicioDelJuegoWindow(final WindowOwner parent, final Caso model) {
    super(parent, model);
    this.setTitle(model.getObjetoDelRobo());
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
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
  }
  
  public Object resolverMisterio() {
    return null;
  }
}
