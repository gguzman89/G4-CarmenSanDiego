package com.example.nigthkids.carmenmobile.model;

import java.util.List;

/**
 * Created by BGH-Ana on 21/6/2017.
 */

public class Caso {

    Integer id;
    PaisConID pais;
    List<String> paisesVisitados;
    List<String> paisesFallidos;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public PaisConID getPais() {
        return pais;
    }

    public void setPais(PaisConID pais) {
        this.pais = pais;
    }

    public List<String> getPaisesVisitados() {
        return paisesVisitados;
    }

    public void setPaisesVisitados(List<String> paisesVisitados) {
        this.paisesVisitados = paisesVisitados;
    }

    public List<String> getPaisesFallidos() {
        return paisesFallidos;
    }

    public void setPaisesFallidos(List<String> paisesFallidos) {
        this.paisesFallidos = paisesFallidos;
    }
}
