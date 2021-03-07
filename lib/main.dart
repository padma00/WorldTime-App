import 'package:WorldTime/Pages/chose_location.dart';
import 'package:WorldTime/Pages/home.dart';
import 'package:WorldTime/Pages/loading.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChoseLocation(),
      },
    ));
