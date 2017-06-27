package com.example.nigthkids.carmenmobile.model;

/**
 * Created by NigthKids on 23/06/2017.
 */

public class EmitirOrdenRequest {
    private Integer villanoId;
    private Integer casoId;

    public EmitirOrdenRequest(Integer villanoId, Integer casoId) {
        this.villanoId = villanoId;
        this.casoId = casoId;
    }

    public Integer getVillanoId() {
        return villanoId;
    }

    public void setVillanoId(Integer villanoId) {
        this.villanoId = villanoId;
    }

    public Integer getCasoId() {
        return casoId;
    }

    public void setCasoId(Integer casoId) {
        this.casoId = casoId;
    }

}
