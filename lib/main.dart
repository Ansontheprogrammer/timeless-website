import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeless_app/views/home/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timeless App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.purple,
          accentColor: Colors.orange,
          textTheme: TextTheme(
              bodyText2: GoogleFonts.lato(fontSize: 22.0),
              bodyText1: GoogleFonts.lato(fontSize: 18.0),
              caption:
                  GoogleFonts.lato(fontSize: 16.0, fontWeight: FontWeight.w900),
              button: GoogleFonts.lato(fontSize: 14.0),
              headline1: GoogleFonts.ubuntu(
                  fontSize: 28.0, fontWeight: FontWeight.bold))),
      home: HomeView(),
    );
  }
}
