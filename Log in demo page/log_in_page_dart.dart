import 'package:flutter/material.dart'; // gets material library of flutter.

import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth, UserCredential; // imports firebase auth

class LoginPage extends StatefulWidget { /* defines LoginPage widget as stateful which can store and update
   data over time. */
  const LoginPage({super.key}); // public class key constructor for optimization.

  @override // overrides the method which means the method is not forced.
  State<StatefulWidget> createState() => _LoginPageState(); /* to create a new instance of the
   _LoginPageState class (the actual logic and UI goes there). */

}

enum FormType { // enum is a single form widget used for checking the current form sate(FormType) which is login or register.

  login,

  register

}

class _LoginPageState extends State<LoginPage> { // here the widgets state and UI are managed and it extends
  // to State<LoginPage.

  final formKey = GlobalKey<FormState> (); /* creates a unique key that Flutter uses to identify and gives access to
   the forms internal state, so we can call .validate() later. */

  late String _email;

  // late means they'll be initialized later and its a string a var.

  late String _password;

  FormType _formType = FormType.login; // sets the forms initial state to login of the FormType enum in _formType variable.

  bool validateAndSave () {

    final form = formKey.currentState; // it gives access to the forms runtime state

    if (form!.validate()) { /* .validate() calls all the validator: functions in the form fields.
       if validator returns null .validate() returns true. */

      form.save(); // calls the onSaved method in the form

      return true; // prints it in the console for testing.

    } else {

      return false;//print('Form is invalid');

    }

  }

  void validateAndSubmit() async { // async tells the function might contain operations that won't complete immediately and that it will return a Future

    if (validateAndSave()) {

      try {
        if (_formType == FormType.login) {

          UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password); // signs in with firebase if the user exists.
          // await pauses the execution of the async function until the Future returned by the expression completes

          print('Signed in: ${user.uid}');

        } else {

         UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password); // creates user in firebase for authentication
          print('Registered user: ${user.uid}');

        }
      }
      catch (e) {
        print('Error: $e'); // if theres in error it prints it in the console.
      }
    }

  }

  void moveToRegister () {

    formKey.currentState!.reset(); // if the form is not null meaning its filled it resets the state or empties the fields.

    setState((){

      _formType =FormType.register; // sets the form state to register

    });

  }

  void moveToLogin () {

    formKey.currentState!.reset(); // if the form is not null meaning its filled it resets the state or empties the fields.

    setState((){

      _formType =FormType.login; // sets the form state to login

    });

  }

  @override
  Widget build(BuildContext context){ // builds the UI and context gives excess to the widget tree, theme etc.

    return Scaffold( // scaffold widget provides basic visual of a material app like AppBar, body and more.

      appBar: AppBar ( // creates a top AppBar.

        title: Text('Flutter log in demo'), // the title is Flutter log in demo.

      ),

      body: Container( // Container widget means the main body is a container.

        padding: EdgeInsets.all(16.0), // padding around all sides is 16 logical pixels.

        child: Form( // Form widget wraps input fields which makes it easier to validate and submit forms.

          key: formKey, /* assigns formKey to this specific Form widget and this connects form field validators to
           the logic in validateAndSave(). */

          child: Column( // Layouts children vertically using a column.

            crossAxisAlignment: CrossAxisAlignment.stretch, /* it makes child widgets like buttons stretch
               horizontally. */

            children: buildInputs() + buildSubmitButtons(), // takes multiple widgets or list of widgets

          ),

        )

      )

    );

  }

  List<Widget> buildInputs () { // List of widgets for form fields to take input from the user.
    return [

      TextFormField( // creates a input field with a label Email

        decoration: InputDecoration(labelText: 'Email'),

        validator: (value) => value!.isEmpty ? 'Email can\'t be empty' : null,
        /* Checks if the field is empty. If yes, it returns a String message which gets shown below
                 the field in red. But if null is retuned which means no error or field is valid. */

        onSaved: (String? value) { // Saves the email in the form state.

          _email = value ?? ''; // If the value is not null takes it otherwise returns empty string.

        },

      ),

      TextFormField( // creates a input field with a label Password

        decoration: InputDecoration(labelText: 'Password'),

        validator: (value) => value!.isEmpty ? 'Password can\'t be empty' : null,

        obscureText: true, // hides the text like (2***) for security.

        onSaved: (String? value) { // Saves the password in the form state.

          _password = value ?? ''; // If the value is not null takes it otherwise returns empty string.

        },

      ),

    ];
  }

  List<Widget> buildSubmitButtons () { // list of widgets for buttons depending on the login or register form.

    if (_formType == FormType.login) {

      return [

        ElevatedButton( // A raised button.

            onPressed: () { // on pressing the button then the actions are defined here.

              validateAndSave(); // When the button is tapped, it triggers validateAndSave() function.

              validateAndSubmit();
            },

            child: Text(

                'Log in', // the raised button is labeled Log in.

                style: TextStyle(fontSize: 20.0) // sets the button text size.

            )

        ),

        TextButton(

          onPressed: moveToRegister,

          child: Text('Create an account', style: TextStyle(fontSize: 20.0)),

        ),

      ];
    } else {

      return [

        ElevatedButton( // A raised button.

            onPressed: () { // on pressing the button then the actions are defined here.

              validateAndSave(); // When the button is tapped, it triggers validateAndSave() function.

              validateAndSubmit();

            },

            child: Text(

              'Create an account', // the raised button is labeled Log in.

              style: TextStyle(fontSize: 20.0) // sets the button text size.

            )

        ),

        TextButton(

          onPressed: moveToLogin,

          child: Text('Have an account? Log in', style: TextStyle(fontSize: 20.0)),

        ),

      ];

    }
  }
}

extension on UserCredential {
  get uid => null; // getter gets the uid of the user from the firebase UserCredential library
}


