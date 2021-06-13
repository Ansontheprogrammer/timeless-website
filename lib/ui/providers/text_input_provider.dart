import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class TextInputProvider with ChangeNotifier {
  bool _isFocused = false;
  bool get isFocused => _isFocused;

  void toggleIsFocused() {
    if (kDebugMode) {
      print('TOGGLE IS FOCUSED $isFocused');
    }
    _isFocused = !_isFocused;
    if (kDebugMode) {
      print('PRESENT STATE $isFocused');
    }
    notifyListeners();
  }
}
