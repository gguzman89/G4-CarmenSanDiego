package com.example.nigthkids.carmenmobile;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class OrdenDeArrestoActivity extends AppCompatActivity {

    Button btnPista;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_orden_de_arresto);


        btnPista = (Button) findViewById(R.id.btnPista);

        btnPista.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(OrdenDeArrestoActivity.this, PedirPistasActivity.class);
                startActivity(intent);
            }
        });
    }
}
