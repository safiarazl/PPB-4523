package com.example.formapp;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

public class DBHelper extends SQLiteOpenHelper{
    public DBHelper(Context context) {
        super(context, "userData.db", null, 1);
    }

    @Override
    public void onCreate(SQLiteDatabase DB) {
        DB.execSQL("CREATE TABLE userDetails(title TEXT PRIMARY KEY, device TEXT, location TEXT, price TEXT)");
    }

    @Override
    public void onUpgrade(SQLiteDatabase DB, int i, int i1) {
        DB.execSQL("DROP TABLE IF EXISTS userDetails");
    }

    public Boolean insertUserData(String title, String device, String location, String price)
    {
        SQLiteDatabase DB = this.getWritableDatabase();
        ContentValues contentValues = new ContentValues();
        contentValues.put("title", title);
        contentValues.put("device", device);
        contentValues.put("location", location);
        contentValues.put("price", price);
        long result = DB.insert("userDetails", null, contentValues);
        if(result == -1){
            return false;
        } else{
            return true;
        }
    }

    public Boolean userUpdateData(String title, String device, String location, String price)
    {
        SQLiteDatabase DB = this.getWritableDatabase();
        ContentValues contentValues = new ContentValues();
        contentValues.put("title", title);
        contentValues.put("device", device);
        contentValues.put("location", location);
        contentValues.put("price", price);
        Cursor cursor= DB.rawQuery("SELECT * FROM userDetails WHERE title=?", new String[]{title});
        if(cursor.getCount() > 0) {
            long result = DB.update("userDetails", contentValues, "title=?", new String[]{title});
            if(result == -1) {
                return false;
            } else {
                return true;
            }
        } else {
            return false;
        }
    }

    public Boolean deleteData(String title) {
        SQLiteDatabase DB = this.getWritableDatabase();
        Cursor cursor = DB.rawQuery("SELECT * FROM userDetails WHERE title = ?", new String[]{title});
        if (cursor.getCount() > 0) {
            long result = DB.delete("userDetails", "title=?", new String[]{title});
            if (result == -1) {
                return false;
            } else {
                return true;
            }
        } else {
            return false;
        }
    }

    public Cursor getData() {
        SQLiteDatabase DB = this.getWritableDatabase();
        Cursor cursor = DB.rawQuery("SELECT * FROM userDetails", null);
        return cursor;
    }
}
