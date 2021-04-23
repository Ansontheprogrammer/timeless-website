import 'package:flutter/widgets.dart';

/// Creates a [SizedBox] with a medium height. Used within a container for consistent spacing
class ContainerSpacer extends StatelessWidget {
  const ContainerSpacer();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
    );
  }
}
