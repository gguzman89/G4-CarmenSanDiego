package edu.ui.view.CarmenSan10;

import edu.ui.domain.CarmenSan10.Detective;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.windows.Dialog;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.lacar.ui.model.Action;

@SuppressWarnings("all")
public class DialogWindow extends Dialog<Detective> {
  public DialogWindow(final WindowOwner owner, final Detective model) {
    super(owner, model);
    this.setTitle("Titulo de la ventana Dialog");
    this.setTaskDescription("");
  }
  
  public void createFormPanel(final Panel mainPanel) {
    Label _label = new Label(mainPanel);
    _label.setText("Acá se coloca el dialogo que se quiera poner");
    Button _button = new Button(mainPanel);
    final Procedure1<Button> _function = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Ok");
        final Action _function = new Action() {
          public void execute() {
            DialogWindow.this.close();
          }
        };
        it.onClick(_function);
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
  }
}
