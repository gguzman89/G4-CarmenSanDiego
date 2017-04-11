package edu.ui.view.CarmenSan10;

import edu.ui.domain.CarmenSan10.Detective;
import edu.ui.view.runnable.CarmenApplication;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.layout.VerticalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.windows.SimpleWindow;

@SuppressWarnings("all")
public class ResolviendoMisterioWindow extends SimpleWindow<Detective> {
  public ResolviendoMisterioWindow(final CarmenApplication parent, final Detective model) {
    super(parent, model);
    this.setTitle("Resolviendo:");
  }
  
  public void createFormPanel(final Panel mainPanel) {
    final Panel panelDeAcciones = new Panel(mainPanel);
    ColumnLayout _columnLayout = new ColumnLayout(2);
    panelDeAcciones.setLayout(_columnLayout);
    Label _label = new Label(panelDeAcciones);
    _label.setText("Estás en:");
    Label _label_1 = new Label(panelDeAcciones);
    _label_1.setText("Lugares");
    final Panel panelOrdenDeArresto = new Panel(panelDeAcciones);
    ColumnLayout _columnLayout_1 = new ColumnLayout(1);
    panelOrdenDeArresto.setLayout(_columnLayout_1);
    this.boton(panelOrdenDeArresto, "Orden de arresto");
    this.estadoDeLaOrdenDeArresto(panelOrdenDeArresto);
    this.boton(panelDeAcciones, "Biblioteca");
    this.boton(panelDeAcciones, "Viajar");
    this.boton(panelDeAcciones, "Club");
    this.boton(panelDeAcciones, "Expedientes");
    this.boton(panelDeAcciones, "Embajada");
    final Panel panelHistorico = new Panel(mainPanel);
    VerticalLayout _verticalLayout = new VerticalLayout();
    panelHistorico.setLayout(_verticalLayout);
    Label _label_2 = new Label(panelHistorico);
    _label_2.setText("Recorrido criminal:");
  }
  
  public Label estadoDeLaOrdenDeArresto(final Panel panel) {
    Label _label = new Label(panel);
    return _label.setText("Orden ya emitida: Carmen Sandiego");
  }
  
  public Button boton(final Panel panel, final String nombreDelBoton) {
    Button _button = new Button(panel);
    final Procedure1<Button> _function = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption(nombreDelBoton);
      }
    };
    return ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
  }
  
  public void addActions(final Panel actionsPanel) {
  }
}
