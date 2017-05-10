package edu.ui.dominioXTrest;

import edu.ui.domain.CarmenSan10.Villano;
import edu.ui.dominioXTrest.VillanoRest;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class ExpedienteRest {
  private List<Villano> villanos;
  
  public ExpedienteRest() {
    ArrayList<Villano> _arrayList = new ArrayList<Villano>();
    this.villanos = _arrayList;
  }
  
  public ExpedienteRest(final List<Villano> villanos) {
    this.villanos = villanos;
  }
  
  public ArrayList<VillanoRest> minificador() {
    ArrayList<VillanoRest> _xblockexpression = null;
    {
      final ArrayList<VillanoRest> villanosMini = new ArrayList<VillanoRest>();
      for (final Villano villano : this.villanos) {
        Integer _id = villano.getId();
        String _nombre = villano.getNombre();
        VillanoRest _villanoRest = new VillanoRest(_id, _nombre);
        villanosMini.add(_villanoRest);
      }
      _xblockexpression = villanosMini;
    }
    return _xblockexpression;
  }
  
  @Pure
  public List<Villano> getVillanos() {
    return this.villanos;
  }
  
  public void setVillanos(final List<Villano> villanos) {
    this.villanos = villanos;
  }
}
