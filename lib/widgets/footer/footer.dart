import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/utils/custom_text.dart';

class Footer extends StatelessWidget {
  const Footer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 10,
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: Image.asset('assets/images/logo.png'),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextHeadline(
                  text: 'General',
                ),
                const _NavBarItem('Support'),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextHeadline(
                  text: 'Contact Us',
                ),
                const _NavBarItem('Contact'),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;
  const _NavBarItem(this.title);

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
