package com.example.nigthkids.carmenmobile;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import com.example.nigthkids.carmenmobile.model.CarmenServiceFactory;
import com.example.nigthkids.carmenmobile.model.Caso;
import com.example.nigthkids.carmenmobile.model.LugarDeInteres;
import com.example.nigthkids.carmenmobile.model.PistaRest;
import com.example.nigthkids.carmenmobile.service.CarmenService;

import retrofit.Callback;
import retrofit.RestAdapter;
import retrofit.RetrofitError;
import retrofit.client.Response;

public class PedirPistasActivity extends AppCompatActivity {

    String tituloPaisActual;

    LugarDeInteres lugar1;
    LugarDeInteres lugar2;
    LugarDeInteres lugar3;

    Button pista1;
    Button pista2;
    Button pista3;

    TextView lugar;
    TextView pistaByBtn;

    TextView ordenEmitida;

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

        new CarmenServiceFactory().getServiceFactory().iniciarJuego(new Callback<Caso>() {
            @Override
            public void success(Caso caso, Response response) {
                tituloPaisActual = "Pepe";//caso.getPais().getNombre();
                pista1.setText(caso.getPais().getLugares().get(0).getNombre());
                pista2.setText(caso.getPais().getLugares().get(1).getNombre());
                pista3.setText(caso.getPais().getLugares().get(2).getNombre());
                lugar1 = (caso.getPais().getLugares().get(0));
                lugar2 = (caso.getPais().getLugares().get(1));
                lugar3 = (caso.getPais().getLugares().get(2));
            }

            @Override
            public void failure(RetrofitError error) {
                // t.printStackTrace();
                //Log.e("CarmenApp"), t.getMessage());
            }
        });

        pista1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String nameBtn1 = pista1.getText().toString();
                lugar.setText(nameBtn1);
                obtenerPistaDe(lugar1);
            }
        });

        pista2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String nameBtn2 = pista2.getText().toString();
                lugar.setText(nameBtn2);
                obtenerPistaDe(lugar2);
            }
        });

        pista3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String nameBTn3 = pista3.getText().toString();
                lugar.setText(nameBTn3);
                obtenerPistaDe(lugar3);
            }
        });

        orden.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(PedirPistasActivity.this, OrdenDeArrestoActivity.class);
                startActivity(intent);
            }
        });

        getSupportActionBar().setTitle("Estas en: " + tituloPaisActual);
        // averiguar como puedo cambiar el titulo sin null


    }

    public void obtenerPistaDe(LugarDeInteres lugar) {
        new CarmenServiceFactory().getServiceFactory().getPista(lugar, "1", new Callback<PistaRest>() {
            @Override
            public void success(PistaRest pistaRest, Response response) {
                pistaByBtn.setText(pistaRest.getPista());
            }

            @Override
            public void failure(RetrofitError error) {

            }
        });
    }

}
