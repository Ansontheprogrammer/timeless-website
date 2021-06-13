import 'package:flutter/cupertino.dart';

class TextInputProvider with ChangeNotifier {
  bool _isFocused = false;
  bool get isFocused => _isFocused;

  void toggleIsFocused() {
    _isFocused = !_isFocused;
    notifyListeners();
  }
}
