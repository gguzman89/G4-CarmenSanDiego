package edu.ui.view.CarmenSan10;

import edu.ui.domain.CarmenSan10.Mapamundi;
import java.awt.Color;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.bindings.ObservableItems;
import org.uqbar.arena.layout.HorizontalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.List;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.Selector;
import org.uqbar.arena.widgets.tables.Column;
import org.uqbar.arena.widgets.tables.Table;
import org.uqbar.arena.windows.SimpleWindow;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.arena.xtend.ArenaXtendExtensions;
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
        MapamundiWindow.this.setTitle("Mapamundi");
        Panel _panel = new Panel(it);
        final Procedure1<Panel> _function = new Procedure1<Panel>() {
          public void apply(final Panel it) {
            List<Object> _list = new List<Object>(it);
            final Procedure1<List<Object>> _function = new Procedure1<List<Object>>() {
              public void apply(final List<Object> it) {
                ObservableItems<Selector<Object>, Object, ListBuilder<Object>> _items = it.items();
                ArenaXtendExtensions.operator_spaceship(_items, "paises");
              }
            };
            ObjectExtensions.<List<Object>>operator_doubleArrow(_list, _function);
            Button _button = new Button(it);
            final Procedure1<Button> _function_1 = new Procedure1<Button>() {
              public void apply(final Button it) {
                it.setCaption("Eliminar");
              }
            };
            ObjectExtensions.<Button>operator_doubleArrow(_button, _function_1);
            Button _button_1 = new Button(it);
            final Procedure1<Button> _function_2 = new Procedure1<Button>() {
              public void apply(final Button it) {
                it.setCaption("Editar");
              }
            };
            ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_2);
            Button _button_2 = new Button(it);
            final Procedure1<Button> _function_3 = new Procedure1<Button>() {
              public void apply(final Button it) {
                it.setCaption("Nuevo");
              }
            };
            ObjectExtensions.<Button>operator_doubleArrow(_button_2, _function_3);
          }
        };
        final Panel ladoIzq = ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
        Panel _panel_1 = new Panel(it);
        final Procedure1<Panel> _function_1 = new Procedure1<Panel>() {
          public void apply(final Panel it) {
            Label _label = new Label(it);
            final Procedure1<Label> _function = new Procedure1<Label>() {
              public void apply(final Label it) {
                it.setText("Nombre:");
              }
            };
            ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
            Label _label_1 = new Label(it);
            _label_1.setText("CaracteriHsticas");
            Table<Mapamundi> _table = new Table<Mapamundi>(it, Mapamundi.class);
            final Procedure1<Table<Mapamundi>> _function_1 = new Procedure1<Table<Mapamundi>>() {
              public void apply(final Table<Mapamundi> it) {
                MapamundiWindow.this.setTitle("Caracteticas");
                Column<Mapamundi> _column = new Column<Mapamundi>(it);
                final Procedure1<Column<Mapamundi>> _function = new Procedure1<Column<Mapamundi>>() {
                  public void apply(final Column<Mapamundi> it) {
                    it.setTitle("CarateristicasPPP");
                    it.setBackground(Color.GRAY);
                    it.setFixedSize(200);
                  }
                };
                ObjectExtensions.<Column<Mapamundi>>operator_doubleArrow(_column, _function);
              }
            };
            final Table<Mapamundi> table = ObjectExtensions.<Table<Mapamundi>>operator_doubleArrow(_table, _function_1);
            Label _label_2 = new Label(it);
            _label_2.setText("Conexiones");
            Table<Mapamundi> _table_1 = new Table<Mapamundi>(it, Mapamundi.class);
            final Procedure1<Table<Mapamundi>> _function_2 = new Procedure1<Table<Mapamundi>>() {
              public void apply(final Table<Mapamundi> it) {
                Column<Mapamundi> _column = new Column<Mapamundi>(it);
                final Procedure1<Column<Mapamundi>> _function = new Procedure1<Column<Mapamundi>>() {
                  public void apply(final Column<Mapamundi> it) {
                    it.setTitle("Conextions");
                    it.setFixedSize(200);
                  }
                };
                ObjectExtensions.<Column<Mapamundi>>operator_doubleArrow(_column, _function);
              }
            };
            final Table<Mapamundi> table2 = ObjectExtensions.<Table<Mapamundi>>operator_doubleArrow(_table_1, _function_2);
            Label _label_3 = new Label(it);
            _label_3.setText("Lugares De Interes");
            Table<Mapamundi> _table_2 = new Table<Mapamundi>(it, Mapamundi.class);
            final Procedure1<Table<Mapamundi>> _function_3 = new Procedure1<Table<Mapamundi>>() {
              public void apply(final Table<Mapamundi> it) {
                Column<Mapamundi> _column = new Column<Mapamundi>(it);
                final Procedure1<Column<Mapamundi>> _function = new Procedure1<Column<Mapamundi>>() {
                  public void apply(final Column<Mapamundi> it) {
                    it.setTitle("Lugares");
                    it.setFixedSize(200);
                  }
                };
                ObjectExtensions.<Column<Mapamundi>>operator_doubleArrow(_column, _function);
              }
            };
            final Table<Mapamundi> table3 = ObjectExtensions.<Table<Mapamundi>>operator_doubleArrow(_table_2, _function_3);
          }
        };
        final Panel ladoDer = ObjectExtensions.<Panel>operator_doubleArrow(_panel_1, _function_1);
      }
    };
    final Panel general = ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
  }
  
  protected void addActions(final Panel actionsPanel) {
  }
}
