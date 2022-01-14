import 'package:flutter/material.dart';

class detMak extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Detail makanan"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              child: Image.asset(
                "assets/pict/nasiayam.jpg",
                width: 543,
                height: 306,
              ),
            ),
            Center(
              child: Text(
                "Nasi ayam special",
                style: TextStyle(fontSize: 40),
              ),
            ),
            Container(child: Text("Mundurrr"))
          ],
        ),
      ),
    );
  }
}
