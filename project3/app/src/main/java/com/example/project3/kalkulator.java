package com.example.project3;

import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import org.w3c.dom.Text;

public class kalkulator extends AppCompatActivity {
    EditText angk1,angk2;
    TextView hasilnya;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_calculator);

        angk1=(EditText) findViewById(R.id.angka1);
        angk2=(EditText) findViewById(R.id.angka2);
        hasilnya=(TextView) findViewById(R.id.hasilhitung);
    }

    public void hitung(View view) {
        int a1=Integer.parseInt(angk1.getText().toString());
        int a2=Integer.parseInt(angk2.getText().toString());
        Integer hasil=a1+a2;
        hasilnya.setText(hasil.toString());
    }
}