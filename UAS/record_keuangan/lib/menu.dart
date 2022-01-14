import 'package:flutter/material.dart';
import 'package:record_keuangan/detail_makanan.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Menu makanan"),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return detMak();
                }));
              },
              child: Card(
                child: Container(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/pict/nasigorengayam.jpg',
                        width: 150,
                        height: 150,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Nasi goreng ayam",
                                style: TextStyle(fontSize: 25),
                              ),
                            ],
                          ),
                          Text(
                            "Rp.8000",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return detMak();
                }));
              },
              child: Card(
                child: Container(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/pict/nasigorengayam.jpg',
                        width: 150,
                        height: 150,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Nasi goreng ayam spesial",
                                style: TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                          Text(
                            "Rp.12000",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return detMak();
                }));
              },
              child: Card(
                child: Container(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/pict/nasigorengtelur.jpg',
                        width: 150,
                        height: 150,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Nasi goreng telur",
                                style: TextStyle(fontSize: 25),
                              ),
                            ],
                          ),
                          Text(
                            "Rp.11000",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return detMak();
                }));
              },
              child: Card(
                child: Container(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/pict/nasirames.jpg',
                        width: 150,
                        height: 150,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Nasi rames biasa",
                                style: TextStyle(fontSize: 25),
                              ),
                            ],
                          ),
                          Text(
                            "Rp.8000",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return detMak();
                }));
              },
              child: Card(
                child: Container(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/pict/nasirames.jpg',
                        width: 150,
                        height: 150,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Nasi rames spesial",
                                style: TextStyle(fontSize: 25),
                              ),
                            ],
                          ),
                          Text(
                            "Rp.8000",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
