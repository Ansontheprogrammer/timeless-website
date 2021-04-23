import 'dart:ui';

/// Used for [Color] utilities
class CustomColor {
  static Color getColorHexCode(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
