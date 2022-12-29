import 'dart:ui';

/// Used for [Color] utilities
class CustomColor {
  static Color getColorHexCode(String code) {
    return new Color(int.parse(code.substring(1, 6), radix: 16) + 0xFF000000);
  }

  static Color mobileAppPrimaryBackgroundColor = getColorHexCode('#F2F2F2');
}
