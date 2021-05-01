import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeless_app/ui/shared/utils/custom_text.dart';

class FooterItem extends StatelessWidget {
  final String title;
  const FooterItem(this.title);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      child: Center(
        child: CustomTextNormal(
          color: Colors.white,
          text: title,
        ),
      ),
    );
  }
}
