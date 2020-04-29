import 'package:coronavirus_update/pages/aboutme.dart';
import 'package:coronavirus_update/pages/precaution.dart';
import 'package:flutter/material.dart';
import 'package:coronavirus_update/pages/home.dart';
import 'package:coronavirus_update/pages/load_country.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/':(context) =>Home(),
    '/load_country':(context) =>LoadingCountry(),
    '/precaution':(context) =>Percaution(),
    '/aboutme':(context) =>Aboutme(),
  },

));


