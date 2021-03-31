import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/utils/custom_text.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final String routeName;
  const NavBarItem(this.title, this.routeName);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FlatButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, routeName);
          },
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
