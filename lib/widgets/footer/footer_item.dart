import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeless_app/utils/custom_text.dart';

class FooterItem extends StatelessWidget {
  final String title;
  const FooterItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 5,
        ),
        FlatButton(
          child: CustomTextNormal(
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
