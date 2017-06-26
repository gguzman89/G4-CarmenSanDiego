package com.example.nigthkids.carmenmobile.model;

import com.example.nigthkids.carmenmobile.service.CarmenService;

import retrofit.RestAdapter;

/**
 * Created by NigthKids on 24/06/2017.
 */

public class CarmenServiceFactory {

    public CarmenServiceFactory(){}

    public CarmenService getServiceFactory() {

        String SERVER_IP = "192.168.0.105"; // revisar antes de funcionar
        String API_URL = "http://" + SERVER_IP + ":9000";

        RestAdapter restAdapter = new RestAdapter.Builder().setEndpoint(API_URL).build();

        CarmenService carmenService = restAdapter.create(CarmenService.class);

        return carmenService;
    }
}
