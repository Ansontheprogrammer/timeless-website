import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Used to create a [Column] with it's crossAxisAlignment property set to [CrossAxisAlignment.center] if built on web.
class AdaptiveColumn extends StatelessWidget {
  final List<Widget> children;
  const AdaptiveColumn({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          kIsWeb ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: this.children,
    );
  }
}
