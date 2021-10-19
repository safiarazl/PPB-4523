package com.example.aplikasitoast;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    TextView angkaKounter;
    int angka=0 ;
    protected void onCreate(Bundle savedInstanceState) {
        @Override
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        angkaKounter=findViewById(R.id.Kounter);

    }
    public void toasklik(View view){
//        Toast.makeText(this, "INI ADALAH TOAST", Toast.LENGTH_SHORT).show();
        angka=0;
        angkaKounter.setText(Integer.toString(angka));
    }

    public void tblkounter(View view) {
        angka=angka+1;
        angkaKounter.setText(Integer.toString(angka));

    }
}