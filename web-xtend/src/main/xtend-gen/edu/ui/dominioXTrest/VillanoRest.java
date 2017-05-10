package edu.ui.dominioXTrest;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class VillanoRest {
  private Integer id;
  
  private String nombre;
  
  public VillanoRest() {
    this.nombre = "";
  }
  
  public VillanoRest(final Integer id, final String nombre) {
    this.id = id;
    this.nombre = nombre;
  }
  
  @Pure
  public Integer getId() {
    return this.id;
  }
  
  public void setId(final Integer id) {
    this.id = id;
  }
  
  @Pure
  public String getNombre() {
    return this.nombre;
  }
  
  public void setNombre(final String nombre) {
    this.nombre = nombre;
  }
}
