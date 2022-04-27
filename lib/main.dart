import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'India.dart';
import 'Page1.dart';

void main() {
  runApp(MaterialApp(
    title: "App",
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
          children: [
            ClipPath(
              clipper: WaveClipperOne(),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.purple, Colors.indigo]
                  ),
                ),
                height: 300,
                child: Center(
                  child: Text(
                    'Bharat-Cov\n   Tracker',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow[600],
                      fontFamily: 'Schyler',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,

            ),
            Center(
              child: Text(
                '   Stay Safe\nStay Healthy',
                style: TextStyle(
                  fontFamily: 'Schyler',
                  fontSize: 35,

                ),
              ),

            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => Page1()));
              },
              child: Align(
                alignment: Alignment.bottomRight,


                child:Padding(
                  padding: const EdgeInsets.fromLTRB(0.0,70.0,20.0,0.0),
                  child: Text(
                  'Start >',


                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    color:Colors.indigo[900],
                  ),
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
