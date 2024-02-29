import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SingleChildScrollView',
      home: Scaffold(
        appBar: AppBar(
          title: Text('SingleChildScrollView'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                width: 150,
                height: 150,
                color: Colors.amberAccent,
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.blueAccent,
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.redAccent,
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.greenAccent,
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.cyanAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}