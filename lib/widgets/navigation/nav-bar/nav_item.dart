import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/utils/custom_text.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  const NavBarItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FlatButton(
          onPressed: () {},
          child: CustomTextNormal(
            color: Colors.white,
            text: title,
          ),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
