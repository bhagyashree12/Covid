import 'dart:convert';

import 'package:coronavirus_update/model/cases_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:http/http.dart';
import 'package:shimmer/shimmer.dart';

Future<Cases_global> getGlobaldata() async {
  String url = "https://api.covid19api.com/summary";
  Response response = await get(url);
  if (response.statusCode == 200) {
    Map data = jsonDecode(response.body);
    return Cases_global.fromJson(data['Global']);
  } else {
    print("Something went wrong");
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Cases_global> global;

  @override
  void initState() {
    super.initState();
    global = getGlobaldata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CoronaVirus"),
        backgroundColor: Colors.blue[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      drawer: ClipPath(
        clipper: WaveClipperTwo(),
        child: Container(
          height: 590,
          child: Drawer(
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Center(
                      child: Image(
                    image: AssetImage("assests/download.png"),
                  )),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("home",
                  ),
                  onTap: () {
                   // Navigator.pushNamed(context, '/');
                    Navigator.popAndPushNamed(context, '/');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.map),
                  title: Text("Countries"),
                  onTap: () {
                    //Navigator.pushNamed(context, '/load_country');
                    Navigator.popAndPushNamed(context, '/load_country');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.local_hospital),
                  title: Text("Precaution"),
                  onTap: () {
                   // Navigator.pushNamed(context, '/precaution');
                    Navigator.popAndPushNamed(context, '/precaution');

                  },
                ),
                Divider(
                  height: 20.0,
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("About me"),
                  onTap: () {
                   // Navigator.pushNamed(context, '/aboutme');
                    Navigator.popAndPushNamed(context, '/aboutme');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage("assests/download.png"),
              height: 150.0,
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: <Widget>[
                  Text("Cases Update",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      )),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            FutureBuilder<Cases_global>(
              future: global,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final totalconfirmed = snapshot.data.TotalConfirmed;
                  final totaldeath = snapshot.data.TotalDeaths;
                  final totalrecover = snapshot.data.TotalRecovered;
                  return Column(
                    children: <Widget>[
                      Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                              height: 50.0,
                              width: 280.0,
                              child: Center(
                                  child: Text("Confirmed : $totalconfirmed",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange[600],
                                      )))),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Card(
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                                height: 50.0,
                                width: 280.0,
                                child: Center(
                                    child: Text("Death : $totaldeath",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red[900],
                                        )))),
                          )),
                      SizedBox(height: 10.0),
                      Card(
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                                height: 50.0,
                                width: 280.0,
                                child: Center(
                                    child: Text("Recovered : $totalrecover",

                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                        )))),
                          ))
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner.
                return Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: Colors.grey[500],
                  child: ShimmerList(),
                );
              },
            ),
            RaisedButton.icon(
              elevation: 10.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(color: Colors.red)),
              onPressed: () {
                print("clicked");
                Navigator.pushNamed(context, "/load_country");
              },
              icon: Icon(
                Icons.location_on,
                color: Colors.red,
              ),
              label: Center(child: Text("View by Country")),
            ),
          ],
        ),
      ),
    );
  }
}

class ShimmerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 150.0,
              width: 280.0,
              child: Center(),
            )));
  }
}
