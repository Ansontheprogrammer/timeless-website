import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeless_app/views/about.dart';
import 'package:timeless_app/views/contact.dart';
import 'package:timeless_app/views/home.dart';
import 'package:timeless_app/views/search.dart';

import 'utils/custom_text.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

/* When building for web ->
  To get over build issues with firestore, I needed to downgrade the firestore web sdk 
  Issue -> https://github.com/FirebaseExtended/flutterfire/issues/4127
  Resolution ->   <script src="http://www.gstatic.com/firebasejs/7.20.0/firebase-firestore.js"></script>
*/

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
              bodyText2: GoogleFonts.quicksand(fontSize: 22.0),
              bodyText1: GoogleFonts.quicksand(fontSize: 18.0),
              caption: GoogleFonts.quicksand(
                  fontSize: 24.0, fontWeight: FontWeight.w900),
              button: GoogleFonts.quicksand(fontSize: 14.0),
              headline1: GoogleFonts.jura(
                fontSize: 48.0,
                fontWeight: FontWeight.w100,
              ))),
      initialRoute: '/',
      routes: {
        HomeView.route: (context) => HomeView(),
        SearchView.route: (context) => SearchView(),
        ContactView.route: (context) => ContactView(),
        AboutView.route: (context) => AboutView()
      },
    );
  }
}
