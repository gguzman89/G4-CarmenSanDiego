package edu.ui.view.CarmenSan10;

import edu.ui.domain.CarmenSan10.Mapamundi;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.bindings.ObservableItems;
import org.uqbar.arena.bindings.ObservableValue;
import org.uqbar.arena.layout.HorizontalLayout;
import org.uqbar.arena.layout.VerticalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Control;
import org.uqbar.arena.widgets.List;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.Selector;
import org.uqbar.arena.windows.SimpleWindow;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.arena.xtend.ArenaXtendExtensions;
import org.uqbar.lacar.ui.model.ControlBuilder;
import org.uqbar.lacar.ui.model.ListBuilder;

@SuppressWarnings("all")
public class MapamundiWindow extends SimpleWindow<Mapamundi> {
  public MapamundiWindow(final WindowOwner parent, final Mapamundi mapa) {
    super(parent, mapa);
  }
  
  protected void createFormPanel(final Panel mainPanel) {
    Panel _panel = new Panel(mainPanel);
    final Procedure1<Panel> _function = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        HorizontalLayout _horizontalLayout = new HorizontalLayout();
        it.setLayout(_horizontalLayout);
      }
    };
    final Panel horizontal = ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
    Panel _panel_1 = new Panel(horizontal);
    final Procedure1<Panel> _function_1 = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        VerticalLayout _verticalLayout = new VerticalLayout();
        it.setLayout(_verticalLayout);
        List<Object> _list = new List<Object>(horizontal);
        final Procedure1<List<Object>> _function = new Procedure1<List<Object>>() {
          public void apply(final List<Object> it) {
            ObservableItems<Selector<Object>, Object, ListBuilder<Object>> _items = it.items();
            ArenaXtendExtensions.operator_spaceship(_items, "paises");
            ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
            ArenaXtendExtensions.operator_spaceship(_value, "paisSeleccionado");
          }
        };
        ObjectExtensions.<List<Object>>operator_doubleArrow(_list, _function);
      }
    };
    final Panel vertical = ObjectExtensions.<Panel>operator_doubleArrow(_panel_1, _function_1);
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
