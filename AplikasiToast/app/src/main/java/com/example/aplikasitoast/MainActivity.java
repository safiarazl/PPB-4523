package com.example.aplikasitoast;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    TextView angkaKounter;
    int angka=0 ;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        angkaKounter=findViewById(R.id.Kounter);

    }
    public void toasklik(View view){
        Toast.makeText(this, "INI ADALAH TOAST", Toast.LENGTH_SHORT).show();
    }

    public void tblkounter(View view) {
        angka=angka+1;
        angkaKounter.setText(Integer.toString(angka));

    }
}