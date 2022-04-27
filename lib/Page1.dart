import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trackcovid/India.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final String url = "https://corona.lmao.ninja/v2/countries";

  Future<List> totalDatas;

  Future<List> getTotalData() async {
    var response = await Dio().get(url);
    return response.data;
  }

  @override
  void initState() {
    super.initState();

    totalDatas = getTotalData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text(
          'Bharat-Cov Tracker',

          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300.0,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.yellow[700],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                        ),
                        width: 120.0,
                        height: 90.0,
                        margin: EdgeInsets.fromLTRB(30.0, 20.0, 0.0, 0.0),
                        child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(32.0, 14.0, 0.0, 0.0),
                            child: FutureBuilder(
                                future: totalDatas,
                                builder: (BuildContext context, SnapShot) {
                                  if (SnapShot.hasData) {
                                    final covid = SnapShot.data;
                                    return Text(
                                      ' (+ ${covid[93]['todayCases'].toString()})\n\nTotal Cases\n\n  ${covid[93]['cases'].toString()} ',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    );
                                  } else {
                                    return Text('Loading...');
                                  }
                                })),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red[400],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                        ),
                        width: 120.0,
                        height: 90.0,
                        margin: EdgeInsets.fromLTRB(30.0, 20.0, 0.0, 0.0),
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(32.0, 14.0, 0.0, 0.0),
                          child: FutureBuilder(
                              future: totalDatas,
                              builder: (BuildContext context, SnapShot) {
                                if (SnapShot.hasData) {
                                  final covid = SnapShot.data;
                                  return Text(
                                    '  (+ ${covid[93]['todayDeaths'].toString()})\n\n  Deaths\n\n ${covid[93]['deaths'].toString()}',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  );
                                } else {
                                  return Text('Loading...');
                                }
                              }),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.lightGreen[600],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                        ),
                        width: 120.0,
                        height: 90.0,
                        margin: EdgeInsets.fromLTRB(30.0, 20.0, 0.0, 0.0),
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(22.0, 14.0, 0.0, 0.0),
                          child: FutureBuilder(
                              future: totalDatas,
                              builder: (BuildContext context, SnapShot) {
                                if (SnapShot.hasData) {
                                  final covid = SnapShot.data;
                                  return Text(
                                    '  (+ ${covid[93]['todayRecovered'].toString()})\n\n  Recovered\n\n  ${covid[93]['recovered'].toString()}',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  );
                                } else {
                                  return Text('Loading...');
                                }
                              }),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.lightBlue[300],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                        ),
                        width: 120.0,
                        height: 90.0,
                        margin: EdgeInsets.fromLTRB(30.0, 20.0, 0.0, 0.0),
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(25.0, 14.0, 0.0, 0.0),
                          child: FutureBuilder(
                              future: totalDatas,
                              builder: (BuildContext context, SnapShot) {
                                if (SnapShot.hasData) {
                                  final covid = SnapShot.data;
                                  return Text(
                                    '\nActive Cases\n\n    ${covid[93]['active'].toString()}',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  );
                                } else {
                                  return Text('Loading...');
                                }
                              }),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Card(
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('assets/corona.gif'),
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => India()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'State wise Statistics',
                            //textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.deepPurple[700],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_forward),
                            color: Colors.deepPurple[700],
                            iconSize: 30.0,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
              child: Center(
                child: Text('PRECAUTIONS'),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: 230,
                    width: 150,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Image.asset(
                        'assets/mask.jpg',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Container(
                    height: 230,
                    width: 150,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Image.asset(
                        'assets/sanitizer.jpg',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Container(
                    height: 230,
                    width: 150,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Image.asset(
                        'assets/socialdistancing.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              height: 100.0,
              color: Colors.black12,
              child: Center(
                child: Text('  Copyright©2020\nAll Rights Reserved.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
