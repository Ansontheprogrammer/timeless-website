import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeless_app/views/home/home_view.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

import 'utils/custom_text.dart';

void main() async {
  await DotEnv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Initialize firebase app
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          // Error retrieving Firebase
          if (snapshot.hasError) {
            return Container(
              child: CustomTextNormal(
                text: "There was an error accessing our app",
              ),
            );
          }

          // Firebase retrieved
          if (snapshot.connectionState == ConnectionState.done) {
            return MainApp();
          }

          // Waiting for Firebase to load
          return CircularProgressIndicator();
        });
  }
}

class MainApp extends StatelessWidget {
  const MainApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timeless App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          snackBarTheme: SnackBarThemeData(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.purple,
              elevation: 6.0),
          primarySwatch: Colors.purple,
          accentColor: Colors.orange,
          textTheme: TextTheme(
              bodyText2: GoogleFonts.lato(fontSize: 22.0),
              bodyText1: GoogleFonts.lato(fontSize: 18.0),
              caption:
                  GoogleFonts.lato(fontSize: 24.0, fontWeight: FontWeight.w900),
              button: GoogleFonts.lato(fontSize: 14.0),
              headline1: GoogleFonts.ubuntu(
                fontSize: 28.0,
                fontWeight: FontWeight.w100,
              ))),
      home: HomeView(),
    );
  }
}
