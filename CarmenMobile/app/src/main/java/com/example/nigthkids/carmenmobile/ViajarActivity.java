package com.example.nigthkids.carmenmobile;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.example.nigthkids.carmenmobile.model.CarmenServiceFactory;
import com.example.nigthkids.carmenmobile.model.Caso;
import com.example.nigthkids.carmenmobile.model.ViajeRequest;

import java.util.ArrayList;

import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;

public class ViajarActivity extends AppCompatActivity {

    ListView lvPaises;

    String[] items = {"Argentina", "Bolivia", "Paraguay", "Chile"};

    TextView tvPaisesVisitados;

    Button orden;
    Button pistas;

    ArrayList<String> paisesVisitados;
    ArrayList<String> mini_conexiones;

    ViajeRequest paisSelected;

    Caso varCaso;

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

            mini_conexiones = (ArrayList<String>) bundle.getSerializable("Paises Conexiones");

            tvPaisesVisitados.setText(paisesVisited);
        }

        ArrayAdapter<String> adapter = new ArrayAdapter<String>(getBaseContext(), android.R.layout.simple_list_item_1, mini_conexiones);
        lvPaises.setAdapter(adapter);

        lvPaises.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                paisSelected = new ViajeRequest(position+1, 1);

                new CarmenServiceFactory().getServiceFactory().viajar(paisSelected, new Callback<Caso>() {
                    @Override
                    public void success(Caso caso, Response response) {
                        Toast.makeText(getBaseContext(), "Viajaste a: " + caso.getPais().getNombre(), Toast.LENGTH_LONG).show();

                        varCaso = (Caso) caso;
                    }

                    @Override
                    public void failure(RetrofitError error) {

                    }
                });
            }
        });

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
