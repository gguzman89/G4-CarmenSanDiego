package com.example.nigthkids.carmenmobile;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class ViajarActivity extends AppCompatActivity {

    Button orden;
    Button pistas;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_viajar);



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
                Intent lugaresView = new Intent(ViajarActivity.this, OrdenDeArrestoActivity.class);
                startActivity(lugaresView);
            }
        });
    }
}
