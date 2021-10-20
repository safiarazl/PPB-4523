package com.example.vid5;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Spinner;

import java.lang.reflect.Array;

public class myListView extends AppCompatActivity {
    ListView listview;
    public String bhs_program[] = {"Prolog", "c+", "pascal", "cobol", "perl", "algol l", "java", "PHP", "python"};

    Spinner combo;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_my_list_view);

        listview=(ListView) findViewById(R.id.listdata);
        combo=(Spinner) findViewById(R.id.combodata);
        ArrayAdapter adapter=new ArrayAdapter(myListView.this, R.layout.support_simple_spinner_dropdown_item, bhs_program);
        listview.setAdapter(adapter);
        combo.setAdapter(adapter);
    }
}