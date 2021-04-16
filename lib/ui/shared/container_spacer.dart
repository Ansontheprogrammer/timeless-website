import 'package:flutter/widgets.dart';

class ContainerSpacer extends StatelessWidget {
  const ContainerSpacer();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
    );
  }
}