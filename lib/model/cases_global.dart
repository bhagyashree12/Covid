import 'dart:convert';

import 'package:http/http.dart';

class Cases_global {
  int TotalConfirmed, TotalDeaths, TotalRecovered;

  Cases_global({this.TotalConfirmed, this.TotalDeaths, this.TotalRecovered});

  factory Cases_global.fromJson(Map<String, dynamic> data) {
    return Cases_global(
        TotalConfirmed: data['TotalConfirmed'],
        TotalDeaths: data['TotalDeaths'],
        TotalRecovered: data['TotalRecovered']);
  }

}
