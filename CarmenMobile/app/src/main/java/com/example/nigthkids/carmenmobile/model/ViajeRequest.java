package com.example.nigthkids.carmenmobile.model;

/**
 * Created by NigthKids on 23/06/2017.
 */

public class ViajeRequest {
    private Integer destinoId;
    private Integer casoId;

    public ViajeRequest(Integer destinoId, Integer casoId) {
        this.destinoId = destinoId;
        this.casoId = casoId;
    }

    public Integer getDestinoId() {
        return destinoId;
    }

    public void setDestinoId(Integer destinoId) {
        this.destinoId = destinoId;
    }

    public Integer getCasoId() {
        return casoId;
    }

    public void setCasoId(Integer casoId) {
        this.casoId = casoId;
    }
}
