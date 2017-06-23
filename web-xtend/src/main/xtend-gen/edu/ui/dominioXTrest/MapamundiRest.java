package edu.ui.dominioXTrest;

import edu.ui.domain.CarmenSan10.LugarDeInteres;
import edu.ui.domain.CarmenSan10.Pais;
import edu.ui.dominioXTrest.PaisConID;
import edu.ui.dominioXTrest.PaisRest;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class MapamundiRest {
  private List<Pais> paises;
  
  public MapamundiRest(final List<Pais> domain) {
    this.paises = domain;
  }
  
  public ArrayList<PaisRest> minificador() {
    ArrayList<PaisRest> _xblockexpression = null;
    {
      final ArrayList<PaisRest> paisesMini = new ArrayList<PaisRest>();
      for (final Pais pais : this.paises) {
        Integer _id = pais.getId();
        String _nombrePais = pais.getNombrePais();
        PaisRest _paisRest = new PaisRest(_id, _nombrePais);
        paisesMini.add(_paisRest);
      }
      _xblockexpression = paisesMini;
    }
    return _xblockexpression;
  }
  
  public ArrayList<PaisRest> minificador(final List<Pais> conexiones) {
    ArrayList<PaisRest> _xblockexpression = null;
    {
      final ArrayList<PaisRest> paisesMini = new ArrayList<PaisRest>();
      for (final Pais pais : this.paises) {
        Integer _id = pais.getId();
        String _nombrePais = pais.getNombrePais();
        PaisRest _paisRest = new PaisRest(_id, _nombrePais);
        paisesMini.add(_paisRest);
      }
      _xblockexpression = paisesMini;
    }
    return _xblockexpression;
  }
  
  public PaisConID miniPais(final Pais pais, final List<PaisRest> paisesRest) {
    PaisConID _xblockexpression = null;
    {
      String _nombrePais = pais.getNombrePais();
      List<LugarDeInteres> _lugares = pais.getLugares();
      Integer _id = pais.getId();
      final PaisConID rest = new PaisConID(_nombrePais, _lugares, _id, paisesRest);
      _xblockexpression = rest;
    }
    return _xblockexpression;
  }
  
  @Pure
  public List<Pais> getPaises() {
    return this.paises;
  }
  
  public void setPaises(final List<Pais> paises) {
    this.paises = paises;
  }
}
