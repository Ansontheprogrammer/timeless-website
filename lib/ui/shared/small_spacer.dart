import 'package:flutter/widgets.dart';

/// Creates a [SizedBox] with a small height. Used anywhere for consistent spacing
class SmallSpacer extends StatelessWidget {
  const SmallSpacer();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.025,
    );
  }
}
