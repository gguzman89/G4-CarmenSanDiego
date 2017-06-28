package com.example.nigthkids.carmenmobile.service;

import com.example.nigthkids.carmenmobile.model.*;

import java.util.List;

import retrofit.Callback;
import retrofit.client.Response;
import retrofit.http.Body;
import retrofit.http.GET;
import retrofit.http.POST;
import retrofit.http.Path;
import retrofit.http.Query;

/**
 * Created by BGH-Ana on 21/6/2017.
 */

public interface CarmenService {

    @POST("/iniciarJuego")
    public void iniciarJuego(Callback<Caso> callback);

    @GET("/pistaDelLugar")
    public void getPista(@Query("lugar") String lugar, @Query("caso") String caso, Callback<PistaRest> callback);

    @GET("/villanos")
    public void getVillanos(Callback <List<Villano>> callback);

    @POST("/emitirOrdenPara")
    public void emitirOrdenDeArresto (@retrofit.http.Body EmitirOrdenRequest ordenDeArresto, Callback<Response> callback);

    @POST("/viajar")
    public void viajar (@Body ViajeRequest viaje, Callback<Caso> callback);

}
