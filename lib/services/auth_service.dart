import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  FirebaseAuth auth = FirebaseAuth.instance;

  signIn(String email, String password) {
    auth.signInWithEmailAndPassword(email: email, password: password);
  }
}
