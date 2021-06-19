import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:timeless_app/services/auth_service.dart';
import 'package:timeless_app/services/locator.dart';
import 'package:timeless_app/ui/providers/text_input_provider.dart';
import 'package:timeless_app/ui/shared/utils/custom_color.dart';
import 'package:timeless_app/ui/shared/utils/custom_text.dart';
import 'package:timeless_app/ui/views/about.dart';
import 'package:timeless_app/ui/views/contact.dart';
import 'package:timeless_app/ui/views/detail.dart';
import 'package:timeless_app/ui/views/home.dart';
import 'package:timeless_app/ui/views/login.dart';
import 'package:timeless_app/ui/views/not_found.dart';
import 'package:timeless_app/ui/views/routing_data/parameter_string_extension.dart';
import 'package:timeless_app/ui/views/search.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  if (!kIsWeb) {
    await FlutterStatusbarcolor.setStatusBarColor(
      CustomColor.mobileAppPrimaryBackgroundColor,
    );
    if (useWhiteForeground(Colors.white)) {
      FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    } else {
      FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    }
  }

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationService>(
            create: (_) => AuthenticationService()),
        ChangeNotifierProvider<TextInputProvider>(
            create: (_) => TextInputProvider())
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'Timeless',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: AppBarTheme(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  iconTheme: IconThemeData(color: Colors.black)),
              snackBarTheme: SnackBarThemeData(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.purple,
                  elevation: 6.0),
              primarySwatch: Colors.purple,
              accentColor: Colors.orange,
              textTheme: TextTheme(
                  bodyText2: GoogleFonts.quicksand(fontSize: 22.0),
                  bodyText1: GoogleFonts.quicksand(fontSize: 16.0),
                  caption: GoogleFonts.quicksand(
                      fontSize: 24.0, fontWeight: FontWeight.w900),
                  button: GoogleFonts.quicksand(fontSize: 14.0),
                  headline1: GoogleFonts.jura(
                    fontSize: 48.0,
                    fontWeight: FontWeight.w100,
                  ))),
          initialRoute: '/',
          onGenerateRoute: (settings) {
            if (kDebugMode) print('Generating route ${settings.name}');
            if (settings.name!.contains(DetailView.route) &&
                settings.name!.contains('id')) {
              dynamic routingData =
                  settings.name!.getRoutingData; // Get the routing Data
              String id = routingData['id']; // Get the id from the data.
              // Empty ID passed
              if (id.isEmpty)
                return MaterialPageRoute(
                  builder: (context) {
                    return NotFound();
                  },
                );

              return MaterialPageRoute(
                settings: RouteSettings(name: '${DetailView.route}?id=$id'),
                builder: (context) {
                  return DetailView(
                    id: id,
                  );
                },
              );
            } else {
              MaterialPageRoute(
                builder: (context) {
                  return NotFound();
                },
              );
            }
          },
          routes: {
            HomeView.route: (context) => HomeView(),
            SearchView.route: (context) => SearchView(),
            ContactView.route: (context) => ContactView(),
            AboutView.route: (context) => AboutView(),
            LoginWidget.route: (context) => LoginWidget()
          },
        );
      },
    );
  }
}
