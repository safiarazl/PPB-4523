package com.example.formapp;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.database.Cursor;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;


public class MainActivity extends AppCompatActivity {

    EditText title, device, location, price;
    Button add, edit, del, show;
    DBHelper DB;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        title = findViewById(R.id.title);
        device = findViewById(R.id.device);
        location = findViewById(R.id.location);
        price = findViewById(R.id.price);

        add = findViewById(R.id.btnAdd);
        edit = findViewById(R.id.btnEdit);
        del = findViewById(R.id.btnDel);
        show = findViewById(R.id.btnShow);

        DB = new DBHelper(this);

        add.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String titleTXT = title.getText().toString();
                String deviceTXT = device.getText().toString();
                String locationTXT = location.getText().toString();
                String priceTXT = price.getText().toString();

                Boolean checkInsertData = DB.insertUserData(titleTXT, deviceTXT, locationTXT, priceTXT);
                if(checkInsertData == true) {
                    Toast.makeText(MainActivity.this, "ENTRY UPDATED", Toast.LENGTH_SHORT).show();
                } else {
                    Toast.makeText(MainActivity.this, "NEW ENTRY NOT UPDATED", Toast.LENGTH_SHORT).show();
                }
            }
        });

        edit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String titleTXT = title.getText().toString();
                String deviceTXT = device.getText().toString();
                String locationTXT = location.getText().toString();
                String priceTXT = price.getText().toString();

                Boolean checkUpdateData = DB.userUpdateData(titleTXT, deviceTXT, locationTXT, priceTXT);
                if(checkUpdateData == true)
                    Toast.makeText(MainActivity.this, "ENTRY UPDATED", Toast.LENGTH_SHORT).show();
                else
                    Toast.makeText(MainActivity.this, "NEW ENTRY NOT UPDATED", Toast.LENGTH_SHORT).show();
            }
        });

        del.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String titleTXT = title.getText().toString();

                Boolean checkUpdateData = DB.deleteData(titleTXT);
                if(checkUpdateData == true) {
                    Toast.makeText(MainActivity.this, "ENTRY DELETED", Toast.LENGTH_SHORT).show();
                } else {
                    Toast.makeText(MainActivity.this, "ENTRY NOT DELETED", Toast.LENGTH_SHORT).show();
                }
            }
        });

        show.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Cursor res = DB.getData();
                if(res.getCount() == 0) {
                    Toast.makeText(MainActivity.this, "NO ENTRY EXIST", Toast.LENGTH_SHORT).show();
                }
                StringBuffer buffer = new StringBuffer();
                while (res.moveToNext()) {
                    buffer.append("Title : "+res.getString(0)+"\n");
                    buffer.append("Device : "+res.getString(1)+"\n");
                    buffer.append("Location : "+res.getString(2)+"\n");
                    buffer.append("Price : "+res.getString(3)+"\n");
                }
                AlertDialog.Builder builder = new AlertDialog.Builder(MainActivity.this);
                builder.setCancelable(true);
                builder.setTitle("User Entries");
                builder.setMessage(buffer.toString());
                builder.show();
            }
        });
    }
}