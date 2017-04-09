package edu.ui.view.CarmenSan10;

import edu.ui.domain.CarmenSan10.Mapamundi;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.windows.SimpleWindow;
import org.uqbar.arena.windows.WindowOwner;

@SuppressWarnings("all")
public class MapamundiWindow extends SimpleWindow<Mapamundi> {
  public MapamundiWindow(final WindowOwner parent, final Mapamundi mapa) {
    super(parent, mapa);
  }
  
  protected void createFormPanel(final Panel mainPanel) {
    Panel _panel = new Panel(mainPanel);
    final Procedure1<Panel> _function = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        ColumnLayout _columnLayout = new ColumnLayout(2);
        it.setLayout(_columnLayout);
      }
    };
    final Panel horizontal = ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
  }
  
  protected void addActions(final Panel actionsPanel) {
    Button _button = new Button(actionsPanel);
    final Procedure1<Button> _function = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("clic aqui");
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
  }
}
