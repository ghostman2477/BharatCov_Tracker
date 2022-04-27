import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dio/dio.dart';

class India extends StatefulWidget {
  String str;
  India({this.str});
  @override
  _IndiaState createState() => _IndiaState();
}

class _IndiaState extends State<India> {
  String str = "";

  Future showcard(String ind, inter, recover, death) async {
    await showDialog(
        context: context,
        builder: (BuildContext contect) {
          return AlertDialog(
            backgroundColor: Color(0xFF363636),
            shape: RoundedRectangleBorder(),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    "Indian Cases :$ind",
                    style: TextStyle(fontSize: 25, color: Colors.blue),
                  ),
                  Text(
                    "Foreigner Cases :$inter",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  Text(
                    "Total Recoveries :$recover",
                    style: TextStyle(fontSize: 25, color: Colors.green),
                  ),
                  Text(
                    "Total Deaths :$death",
                    style: TextStyle(fontSize: 25, color: Colors.red),
                  ),
                ],
              ),
            ),
          );
        });
  }

  final String url = "https://api.rootnet.in/covid19-in/stats/latest";
  Future<List> datas;
  Future<List> totalDatas;

  Future<List> getData() async {
    var response = await Dio().get(url);
    return response.data['data']['regional'];
  }

  @override
  void initState() {
    super.initState();
    datas = getData();
  }

  @override
  Widget build(BuildContext context) {
    List<Color> grad1 = [Colors.purple, Colors.indigo];
    List<Color> grad2 = [Colors.white, Colors.grey[400]];

    return Scaffold(
      appBar: AppBar(
          title: Text('Statewise Statistics'),
          backgroundColor: Color(0xFF152238)),
      backgroundColor: Colors.black,
      body: Container(
          padding: EdgeInsets.all(10),
          child: FutureBuilder(
              future: datas,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data);
                  //                widget.str= snapshot.data['total'].toString();

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 2.5,
                        mainAxisSpacing: 10.0),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, index) => SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: Card(
                        //elevation: 10,
                        // child: Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 8),

                        child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: (index % 2 == 0) ? grad1 : grad2,
                                //  colors: [Colors.purple,Colors.indigo]
                              ),
                            ),
                            child: Center(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.only(top: 5.0)),
                                    Text(
                                      snapshot.data[index]["loc"],
                                      style: TextStyle(
                                        fontSize: 17.0,
                                        color: (index%2!=0) ? Colors.black : Colors.yellow[600],
                                        fontFamily: 'Itim',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.only(top: 5.0)),
                                    Text(
                                      'Total Cases:${snapshot.data[index]["confirmedCasesIndian"].toString()}',
                                      style: TextStyle(
                                        color: (index%2!=0) ? Colors.black : Colors.yellow[600],

                                          fontWeight: FontWeight.bold,
                                        //fontFamily: 'Schyler',
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.only(top: 5.0)),
                                    Text(
                                      ' Recovered:${snapshot.data[index]["discharged"].toString()}',
                                      style: TextStyle(
                                        color: (index%2!=0) ? Colors.black : Colors.yellow[600],

                                        fontWeight: FontWeight.bold,
                                        //fontFamily: 'Schyler',
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.only(top: 5.0)),
                                    Text(
                                      ' Deaths:${snapshot.data[index]["deaths"].toString()}',
                                      style: TextStyle(
                                        color: (index%2!=0) ? Colors.black : Colors.yellow[600],

                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ]),
                            )),
                      ),
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              })),
    );
  }
}
