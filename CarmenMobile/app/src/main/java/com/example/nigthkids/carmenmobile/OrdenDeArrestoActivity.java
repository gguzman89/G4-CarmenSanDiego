package com.example.nigthkids.carmenmobile;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.example.nigthkids.carmenmobile.model.CarmenServiceFactory;
import com.example.nigthkids.carmenmobile.model.EmitirOrdenRequest;
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

    int villanoSelected;

    List<String> datos;

    List<Villano> datosVillanos;

    boolean isFirstTime = true;

    EmitirOrdenRequest eoEnviar;

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
        // String[] items = {"Argentina", "Bolivia", "Paraguay", "Chile"};

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

        ArrayAdapter<String> villanos = new ArrayAdapter<String>(getBaseContext(), android.R.layout.simple_spinner_item, datos);

        btnSpinner.setAdapter(villanos);

        btnSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {

                if (isFirstTime) { isFirstTime = false; }
                else {
                    villanoSelected = (Integer) position;
                    //tvVillano.setText(datos.get(position).toString());
                    Toast.makeText(getBaseContext(), datos.get(position), Toast.LENGTH_LONG).show(); }
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });

        eoEnviar = new EmitirOrdenRequest(villanoSelected+1, 1);


        btnPedirOrden.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //tvVillano.setText(datos.get(villanoSelected).toString());
                //Toast.makeText(getBaseContext(), "Orden de arresto", Toast.LENGTH_LONG).show();

            new CarmenServiceFactory().getServiceFactory().emitirOrdenDeArresto(eoEnviar, new Callback<Response>() {
                @Override
                public void success(Response response, Response response2) {
                    tvVillano.setText(datos.get(villanoSelected).toString());
                    Toast.makeText(getBaseContext(), datos.get(villanoSelected), Toast.LENGTH_LONG).show();
                }

                @Override
                public void failure(RetrofitError error) {

                }
            });
            }
        });

        btnVolverPista.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(OrdenDeArrestoActivity.this, PedirPistasActivity.class);
                intent.putExtra("villanoName", tvVillano.getText().toString());
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
