package com.example.nigthkids.carmenmobile.model;

import java.util.List;

/**
 * Created by BGH-Ana on 21/6/2017.
 */

class PaisConID {

    Integer id;
    String nombre;
    List<LugarDeInteres> lugares;
    List<PaisRest> mini_conexiones;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public List<LugarDeInteres> getLugares() {
        return lugares;
    }

    public void setLugares(List<LugarDeInteres> lugares) {
        this.lugares = lugares;
    }

    public List<PaisRest> getMini_conexiones() {
        return mini_conexiones;
    }

    public void setMini_conexiones(List<PaisRest> mini_conexiones) {
        this.mini_conexiones = mini_conexiones;
    }
}
