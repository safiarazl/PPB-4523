package com.example.makananfav;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity2 extends AppCompatActivity {
    ImageView imageView2;
    TextView textNama2, textDeskripsi;
    String data1, data3;
    int imageView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);

        imageView2 = findViewById(R.id.imageView2);
        textNama2 = findViewById(R.id.textNama2);
        textDeskripsi = findViewById(R.id.textDeskripsi);

        TextView sumber = (TextView) findViewById(R.id.sumber);
        sumber.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                getUrl("https://github.com/safiarazl/");
            }
        });
        getData();
        setData();
    }

    private  void getUrl(String s) {
        Uri uri = Uri.parse(s);
        startActivity(new Intent(Intent.ACTION_VIEW,uri));
    }

    private void getData(){
        if(getIntent().hasExtra("imageView") && getIntent().hasExtra("data1")){
            data1 = getIntent().getStringExtra("data1");
            data3 = getIntent().getStringExtra("data3");
            imageView = getIntent().getIntExtra("imageView", 1);

        } else{
            Toast.makeText(this, "No Data", Toast.LENGTH_SHORT).show();
        }
    }
    private void setData(){
        textNama2.setText(data1);
        textDeskripsi.setText(data3);
        imageView2.setImageResource(imageView);
    }
}