package com.example.nigthkids.carmenmobile.service;

import com.example.nigthkids.carmenmobile.model.Caso;

import retrofit.Callback;
import retrofit.http.POST;

/**
 * Created by BGH-Ana on 21/6/2017.
 */

public interface CarmenService {

    @POST("/iniciarJuego")
    public void iniciarJuego(Callback<Caso> callback);


}
