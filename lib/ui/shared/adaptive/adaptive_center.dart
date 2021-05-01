import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Used to wrap a widget with a [Center] if the platform is web.
class AdaptiveCenter extends StatelessWidget {
  final Widget child;
  const AdaptiveCenter({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kIsWeb)
      return Center(child: child);
    else {
      return child;
    }
  }
}
