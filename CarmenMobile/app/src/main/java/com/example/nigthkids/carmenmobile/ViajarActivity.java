package com.example.nigthkids.carmenmobile;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import java.util.ArrayList;

public class ViajarActivity extends AppCompatActivity {

    ListView lvPaises;

    String[] items = {"Argentina", "Bolivia", "Paraguay", "Chile"};

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_viajar);

        lvPaises = (ListView) findViewById(R.id.lvPaises);

        ArrayAdapter<String> adapter = new ArrayAdapter<String>(getBaseContext(), android.R.layout.simple_list_item_1, items);
        lvPaises.setAdapter(adapter);
    }
}
