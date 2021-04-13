import 'package:flutter/widgets.dart';

class SmallSpacer extends StatelessWidget {
  const SmallSpacer();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.025,
    );
  }
}
