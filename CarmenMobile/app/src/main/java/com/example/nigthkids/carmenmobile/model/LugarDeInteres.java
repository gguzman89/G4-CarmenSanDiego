package com.example.nigthkids.carmenmobile.model;

/**
 * Created by BGH-Ana on 21/6/2017.
 */

public enum LugarDeInteres {

    BANCO("Banco"),BIBLIOTECA("Biblioteca"),CLUB("Club"),EMBAJADA("Embajada");

    public String nombre;

     LugarDeInteres()
    {
    }

     LugarDeInteres(String nombre) {
        this.nombre = nombre;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
