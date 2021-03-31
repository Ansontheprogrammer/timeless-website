import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/utils/layout.dart';

class AboutView extends StatelessWidget {
  AboutView();
  static const String route = '/about';

  @override
  Widget build(BuildContext context) {
    return Layout(
        pageContent: Column(
      children: [
        Container(
            padding: EdgeInsets.all(25.0),
            child: CustomTextHeadline(
              text: 'About',
            ))
      ],
    ));
  }
}
