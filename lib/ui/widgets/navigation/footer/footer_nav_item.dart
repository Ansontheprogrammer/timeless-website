import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeless_app/ui/shared/utils/custom_text.dart';

class FooterNavItem extends StatelessWidget {
  final String title;
  final String routeName;
  const FooterNavItem(this.title, this.routeName);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, routeName);
      },
      child: Center(
        child: CustomTextNormal(
          color: Colors.white,
          text: title,
        ),
      ),
    );
  }
}
