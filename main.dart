import 'package:flutter/material.dart';

import 'log_in_page_dart.dart';

void main () {

  runApp( MyApp());

}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build (BuildContext context){

    return MaterialApp(

      title: 'Flutter log in demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        appBarTheme: AppBarTheme (

          backgroundColor: Colors.blue

        ),

      ),

      home: LoginPage()

    );

  }

}