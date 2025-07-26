import 'package:flutter/material.dart'; // gets material library of flutter.

class LoginPage extends StatefulWidget { // defines LoginPage widget as stateful which can store and update
  // data over time.
  const LoginPage({super.key}); // public class key constructor for optimization.

  @override // overrides the method which means the method is not forced.
  State<StatefulWidget> createState() => _LoginPageState(); // to create a new instance of the
  // _LoginPageState class (the actual logic and UI goes there).

}

class _LoginPageState extends State<LoginPage> { // here the widgets state and UI are managed and it extends
  // to State<LoginPage.

  late String _email;

  // late means they'll be initialized later and its a string a var.

  late String _password;

  @override
  Widget build(BuildContext context){ // builds the UI and context gives excess to the widget tree, theme etc.

    return Scaffold( // scaffold widget provides basic visual of a material app like AppBar, body and more.

      appBar: AppBar ( // creates a top AppBar.

        title: Text('Flutter log in demo'), // the title is Flutter log in demo.

      ),

      body: Container( // Container widget means the main body is a container.

        padding: EdgeInsets.all(16.0), // padding around all sides is 16 logical pixels.

        child: Form( // Form widget wraps input fields which makes it easier to validate and submit forms.

          child: Column( // Layouts children vertically using a column.

            crossAxisAlignment: CrossAxisAlignment.stretch, // it makes child widgets like buttons stretch
              // horizontally.

            children: <Widget>[

              TextFormField( // creates a input field with a label Email

                decoration: InputDecoration(labelText: 'Email'),

              ),

              TextFormField ( // creates a input field with a label Password

                decoration: InputDecoration(labelText: 'Password'),

                obscureText: true, // hides the text like (2***) for security.

              ),

              ElevatedButton ( // A raised button.

                onPressed: () { // on pressing the button then the actions are defined here.

                },

                child: Text(

                    'Log in', // the raised button is labeled Log in.

                  style: TextStyle(fontSize: 20.0) // sets the button text size.

                )

              )

            ]

          ),

        )

      )

    );

  }

}
