package com.example.nigthkids.carmenmobile;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import com.example.nigthkids.carmenmobile.service.CarmenService;

import retrofit.RestAdapter;

public class PedirPistasActivity extends AppCompatActivity {

    Button pista1;
    Button pista2;
    Button pista3;

    TextView lugar;
    TextView pistaByBtn;

    Button orden;
    Button viajar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_pedir_pistas);

        pista1 = (Button) findViewById(R.id.btnPista1);
        pista2 = (Button) findViewById(R.id.btnPista2);
        pista3 = (Button) findViewById(R.id.btnPista3);

        lugar = (TextView) findViewById(R.id.tvLugar);
        pistaByBtn = (TextView) findViewById(R.id.tvPista);

        orden = (Button) findViewById(R.id.btnOrden);
        viajar = (Button) findViewById(R.id.btnViajar);

        pista1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String nameBtn1 = pista1.getText().toString();
                lugar.setText(nameBtn1);
                pistaByBtn.setText("Apretaste el 1er button");
            }
        });

        pista2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String nameBtn2 = pista2.getText().toString();
                lugar.setText(nameBtn2);
                pistaByBtn.setText("Apretaste el 2er button");
            }
        });

        pista3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String nameBTn3 = pista3.getText().toString();
                lugar.setText(nameBTn3);
                pistaByBtn.setText("Apretaste el 3er button");
            }
        });

        getSupportActionBar().setTitle("Estas en: " + "Pais");
        // averiguar de donde puedo sacar el Pais -> new Caso

        iniciarCamenService();
    }



    private CarmenService iniciarCamenService() {

        String SERVER_IP = "192.168.0.104"; // revisar antes de funcionar
        String API_URL = "http://" + SERVER_IP + ":9000";

        RestAdapter restAdapter = new RestAdapter.Builder().setEndpoint(API_URL).build();

        CarmenService carmenService = restAdapter.create(CarmenService.class);

        return carmenService;
    }
}
