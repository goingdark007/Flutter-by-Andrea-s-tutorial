import 'package:flutter/material.dart'; // gets material library of flutter.

import 'log_in_page_dart.dart'; // gets the log_in_page_dart file codes.

void main () {

  runApp( MyApp()); // runApp() starts the app from this widget called MyApp.

}

class MyApp extends StatelessWidget{ // defines root widget MyApp which is stateless.

  const MyApp({super.key}); // public classes need constructor key for optimization or identify widgets.

  @override // overrides the build method which means the method is not forced.
  Widget build (BuildContext context){ // every widget must define a build method that returns what the UI.
    // should look like and context gives the info where the widget is in the widget tree.

    return MaterialApp( // starts with Material design it is a root widget that sets app-wide.
      // features like themes, title & navigation.

      title: 'Flutter log in demo', // sets the title or name of the app visible in app switcher.

        theme: ThemeData( // it is a widget that defines app looks and can have widgets inside like appBarTheme.

        primarySwatch: Colors.blue, // sets the base color for components like buttons, progress bars, etc.

        appBarTheme: AppBarTheme ( // sets the look of the app bar.

          backgroundColor: Colors.blue // sets default style for all AppBars in the app.

        ),

      ),

      home: LoginPage() // This tells Flutter to show the LoginPage widget (which I imported earlier)
      // when the app starts.

    );

  }

}
