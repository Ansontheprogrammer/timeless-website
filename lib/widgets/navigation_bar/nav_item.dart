import 'package:flutter/widgets.dart';
import 'package:timeless_app/utils/custom_text.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  const NavBarItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTextNormal(
          text: title,
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
