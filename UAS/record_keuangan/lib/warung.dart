import 'package:flutter/material.dart';
import 'package:record_keuangan/menu.dart';

class Warung extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Warung details"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Container(child: Image.asset('assets/pict/burjo.jpg')),
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: 325,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.timer,
                              size: 50.0,
                            ),
                            Text("Senin-Jumat pukul 05.00-03.00")
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 325,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_pin,
                              size: 50.0,
                            ),
                            Text("Kota Semarang, jawa tengah")
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 325,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.phone,
                              size: 50.0,
                            ),
                            Text("+621234567986357")
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Menu();
                          }));
                        },
                        child: Text("Menu Makanan"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
