package com.example.nigthkids.carmenmobile;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;

import java.util.ArrayList;

public class ViajarActivity extends AppCompatActivity {

    ListView lvPaises;

    String[] items = {"Argentina", "Bolivia", "Paraguay", "Chile"};

    TextView tvPaisesVisitados;

    Button orden;
    Button pistas;

    ArrayList<String> paisesVisitados;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_viajar);

        lvPaises = (ListView) findViewById(R.id.lvPaises);

        tvPaisesVisitados = (TextView) findViewById(R.id.tvPaisesVisitados);

        orden = (Button) findViewById(R.id.btnVolverOrden);
        pistas = (Button) findViewById(R.id.btnVolverViajar);

        Bundle bundle = getIntent().getExtras();

        if(bundle != null) {
            String nombrePaisActual = bundle.getString("nombrePaisActual").toString();
            getSupportActionBar().setTitle("Estas en: " + nombrePaisActual);

            paisesVisitados = (ArrayList<String>) bundle.getSerializable("Paises Visitados");

            String paisesVisited = "";
            for (String nombrePais : items) { //reemplazar con la lista original: paisesVisitados
                paisesVisited = paisesVisited + " -> " + nombrePais;
            }

            

            tvPaisesVisitados.setText(paisesVisited);
        }

        ArrayAdapter<String> adapter = new ArrayAdapter<String>(getBaseContext(), android.R.layout.simple_list_item_1, items);
        lvPaises.setAdapter(adapter);

        orden.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent ordenView = new Intent(ViajarActivity.this, OrdenDeArrestoActivity.class);
                startActivity(ordenView);
            }
        });

        pistas.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent lugaresView = new Intent(ViajarActivity.this, PedirPistasActivity.class);
                startActivity(lugaresView);
            }
        });
    }
}
