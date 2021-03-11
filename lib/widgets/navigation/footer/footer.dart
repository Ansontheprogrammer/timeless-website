import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/utils/custom_section.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/widgets/navigation/footer/footer_item.dart';

class Footer extends StatelessWidget {
  const Footer();

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      color: Colors.black87,
      child: Container(
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
                  color: Colors.white,
                  text: 'General',
                ),
                const FooterItem('Support'),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextHeadline(
                  color: Colors.white,
                  text: 'Contact Us',
                ),
                const FooterItem('Contact'),
              ],
            )
          ],
        ),
      ),
    );
  }
}