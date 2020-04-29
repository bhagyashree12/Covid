import 'dart:convert';

import 'package:coronavirus_update/model/cases_countires.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingCountry extends StatefulWidget {
  @override
  _LoadingCountryState createState() => _LoadingCountryState();
}

class _LoadingCountryState extends State<LoadingCountry> {
  Future<List<Cases_countries>> getCountrydata() async {
    List<Cases_countries> list;
    String url = "https://api.covid19api.com/summary";
    Response response = await get(url);
    Map map = jsonDecode(response.body);
    var rest = map["Countries"];
    //print(rest);
    list =
        rest.map<Cases_countries>((i) => Cases_countries.fromjson(i)).toList();
    //print("List Size: ${list.length}");
    return list;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('View Country Cases'),
          backgroundColor: Colors.blue[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        body: FutureBuilder<List<Cases_countries>>(
            future: getCountrydata(), //future takes the name of function
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Center(child: SpinKitRipple(
                  color: Colors.blue,
                ));
              } else {


                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index)



                    {
                      return Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          height: 150.0,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Text(snapshot.data[index].country,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),),
                                SizedBox(height: 15.0,),
                                Text("Confirmed:" +snapshot.data[index].TotalConfirmed.toString(),
                                style:TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange[600],
                                )),
                                SizedBox(height: 10.0,),
                                Text("Deaths: "+snapshot.data[index].TotalDeaths.toString(),
                                    style:TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red[900],
                                    )
                                ),
                                SizedBox(height: 10.0,),
                                Text("Recovered :"+snapshot.data[index].TotalRecovered.toString(),
                                    style:TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }
            }));
  }
}
