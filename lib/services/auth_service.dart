import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthenticationService with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signIn(String email, String password) async {
    try {
      if (kDebugMode) {
        await auth.signInWithEmailAndPassword(
            email: 'ansonervin@gmail.com', password: 'dreamg');
        return;
      }
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return;
    } catch (err) {
      throw err;
    }
  }

  bool isUserLoggedIn() {
    return auth.currentUser != null;
  }
}
