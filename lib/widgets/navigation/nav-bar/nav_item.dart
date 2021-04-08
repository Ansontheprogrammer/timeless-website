import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/utils/custom_text.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final Color color;
  final String routeName;
  const NavBarItem(
      {required this.title,
      required this.routeName,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FlatButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, routeName);
          },
          child: CustomTextHeadline(
            fontSize: 18.0,
            color: this.color,
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
