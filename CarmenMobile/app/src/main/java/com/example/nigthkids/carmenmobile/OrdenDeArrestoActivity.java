package com.example.nigthkids.carmenmobile;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.TextView;

import com.example.nigthkids.carmenmobile.model.CarmenServiceFactory;
import com.example.nigthkids.carmenmobile.model.Villano;

import java.util.ArrayList;
import java.util.List;

import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;

public class OrdenDeArrestoActivity extends AppCompatActivity {

    Button btnVolverPista;
    Button btnPedirOrden;
    TextView tvVillano;

    Spinner btnSpinner;

    String[] valores;

    String[] items = {"Argentina", "Bolivia", "Paraguay", "Chile"};

    List<String> datos;

    List<Villano> datosVillanos;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_orden_de_arresto);

        btnVolverPista = (Button) findViewById(R.id.btnPista);
        btnPedirOrden = (Button) findViewById(R.id.btnPedirOrden);
        tvVillano = (TextView) findViewById(R.id.tvVillano);

        btnSpinner = (Spinner) findViewById(R.id.spinner);

        valores = getResources().getStringArray(R.array.opciones);

        datos = new ArrayList<String>();

        // desde un archivo
        //ArrayAdapter<String> villanos = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item, valores);

        // creado mediante un lista de String
        //ArrayAdapter<String> villanos = new ArrayAdapter<String>(getBaseContext(), android.R.layout.simple_spinner_item, items);

        new CarmenServiceFactory().getServiceFactory().getVillanos(new Callback<List<Villano>>() {
            @Override
            public void success(List<Villano> villanos, Response response) {
                datosVillanos = (List<Villano>) villanos;
                datos = pasarVillanosAString(datosVillanos, datos);
            }

            @Override
            public void failure(RetrofitError error) {
                tvVillano.setText("no cargo el servidor o hizo mal la consulta");
            }
        });

        datos.add("Seleccione Villano"); // hasta el momento es solo un parche :P
        //datos.add("Villano 2");
        //datos.add("Villano 3");
        //datos.add("Villano 4");

        ArrayAdapter<String> villanos = new ArrayAdapter<String>(getBaseContext(), android.R.layout.simple_spinner_item, datos);

        //btnSpinner.setDropDownVerticalOffset(android.R.layout.simple_spinner_item);
        btnSpinner.setAdapter(villanos);


        btnVolverPista.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(OrdenDeArrestoActivity.this, PedirPistasActivity.class);
                startActivity(intent);
            }
        });


    }

    public List<String> pasarVillanosAString(List<Villano> datosVillanos, List<String> datos) {
        for (Villano villano : datosVillanos) {
            datos.add(villano.getNombre());
        }

        return datos;
    }
}
