import 'package:flutter/material.dart';
import 'package:worldtime/pages/choose_loation.dart';
import 'package:worldtime/pages/gps.dart';
import 'package:worldtime/pages/home.dart';
import 'package:worldtime/pages/loading.dart';

void main() => runApp(MaterialApp(

initialRoute: '/',
    routes: {
     '/': (Context) => loading(),
      '/home':(Context) => home(),
       '/location':(Context) => location(),
      //'/gps':(Context) => gps(),
    }

    ));


