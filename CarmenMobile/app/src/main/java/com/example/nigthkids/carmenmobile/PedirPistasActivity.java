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
import com.example.nigthkids.carmenmobile.model.PaisRest;
import com.example.nigthkids.carmenmobile.model.PistaRest;
import com.example.nigthkids.carmenmobile.service.CarmenService;

import java.util.List;

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

    Caso varCaso;

    List<String> mini_conexiones;
    List<String> paisesVitados;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_pedir_pistas);

        pista1 = (Button) findViewById(R.id.btnPista1);
        pista2 = (Button) findViewById(R.id.btnPista2);
        pista3 = (Button) findViewById(R.id.btnPista3);

        lugar = (TextView) findViewById(R.id.tvLugar);
        pistaByBtn = (TextView) findViewById(R.id.tvPista);

        ordenEmitida = (TextView) findViewById(R.id.tvNombreVillano);

        orden = (Button) findViewById(R.id.btnOrden);
        viajar = (Button) findViewById(R.id.btnViajar);

        Bundle bundle = getIntent().getExtras();

        if( bundle != null){
            String villanoNombre = bundle.getString("villanoName").toString();
            ordenEmitida.setText(villanoNombre); }

        new CarmenServiceFactory().getServiceFactory().iniciarJuego(new Callback<Caso>() {
            @Override
            public void success(Caso caso, Response response) {
                tituloPaisActual = (String) caso.getPais().getNombre();
                pista1.setText(caso.getPais().getLugares().get(0).getNombre());
                pista2.setText(caso.getPais().getLugares().get(1).getNombre());
                pista3.setText(caso.getPais().getLugares().get(2).getNombre());
                lugar2 = (LugarDeInteres) caso.getPais().getLugares().get(1);
                lugar3 = (LugarDeInteres) caso.getPais().getLugares().get(2);

                varCaso = (Caso) caso;

                getSupportActionBar().setTitle("Estas en: " + tituloPaisActual);
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
                obtenerPista(0);
            }
        });

        pista2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String nameBtn2 = pista2.getText().toString();
                lugar.setText(nameBtn2);

                obtenerPista(1);
            }
        });

        pista3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String nameBTn3 = pista3.getText().toString();
                lugar.setText(nameBTn3);
                obtenerPista(2);
            }
        });

        orden.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(PedirPistasActivity.this, OrdenDeArrestoActivity.class);
                startActivity(intent);
            }
        });

        //mini_conexiones = (ArrayList<String>) cambiarTextoPista(varCaso.getPais().getMini_conexiones(), mini_conexiones);
        //paisesVitados = (List<String>) varCaso.getPaisesVisitados();

        viajar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(PedirPistasActivity.this, ViajarActivity.class);
                intent.putExtra("nombrePaisActual", tituloPaisActual);
                //intent.putIntegerArrayListExtra("Paises Conexiones", mini_conexiones);

                startActivity(intent);
            }
        });
        //getSupportActionBar().setTitle("Estas en: " + tituloPaisActual);
        // averiguar como puedo cambiar el titulo sin null
        // o como puede ponerlo al tiempo que se actualize o viaje

    }



    public List<String> pasarPaisesAString(List<PaisRest> mini_conexiones, List<String> miniStrings) {
        for (PaisRest pais : mini_conexiones) {
                miniStrings.add(pais.getNombre());
        }
        return miniStrings;
    }

    private void cambiarTextoPista(PistaRest pistaRest) {
        pistaByBtn.setText(pistaRest.getPista());
    }

    public void obtenerPista(Integer indexPista) {
        new CarmenServiceFactory().getServiceFactory().getPista(varCaso.getPais().getLugares().get(indexPista).getNombre().toUpperCase(), "1", new Callback<PistaRest>() {
            @Override
            public void success(PistaRest pistaRest, Response response) {
                //cambiarTextoPista(pistaRest);
                pistaByBtn.setText(pistaRest.getPista().toString());
            }

            @Override
            public void failure(RetrofitError error) {
                pistaByBtn.setText("Enum problem");
            }
        });
    }

    /**@Override
    protected void onResume() {
        super.onResume();

        Bundle bundle = getIntent().getExtras();

        String villanoNombre = bundle.getString("villanoName").toString();

        ordenEmitida.setText(villanoNombre);
    }*/
}