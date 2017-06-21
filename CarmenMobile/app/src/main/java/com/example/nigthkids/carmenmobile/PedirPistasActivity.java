package com.example.nigthkids.carmenmobile;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import com.example.nigthkids.carmenmobile.service.CarmenService;

import retrofit.RestAdapter;

public class PedirPistasActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_pedir_pistas);

        getSupportActionBar().setTitle("sadsadas");

        iniciarCamenService();
    }

    private CarmenService iniciarCamenService() {

        String SERVER_IP = "10.9.1.115";
        String API_URL = "http://" + SERVER_IP + ":9000";

        RestAdapter restAdapter = new RestAdapter.Builder().setEndpoint(API_URL).build();

        CarmenService carmenService = restAdapter.create(CarmenService.class);

        return carmenService;
    }
}
