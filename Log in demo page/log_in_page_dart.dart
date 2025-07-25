import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => new _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {

  late String _email;

  late String _password;

  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar: AppBar (

        title: Text('Flutter log in demo'),

      ),

      body: Container(

        padding: EdgeInsets.all(16.0),

        child: Form(

          child: Column(

            children: <Widget>[

              TextFormField(

                decoration: InputDecoration(labelText: 'Email'),

              ),

              TextFormField (

                decoration: InputDecoration(labelText: 'Password'),

                obscureText: true,

              )

            ]

          ),

        )

      )

    );

  }

}