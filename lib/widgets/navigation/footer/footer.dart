import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/utils/custom_section.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/utils/small_spacer.dart';
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
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextHeadline(
                  color: Colors.white,
                  text: 'General',
                ),
                SmallSpacer(),
                const FooterItem('About'),
                const FooterItem('Contact'),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextHeadline(
                  color: Colors.white,
                  text: 'Contact Us',
                ),
                SmallSpacer(),
                const FooterItem('anson.ervin@ansonervin.com'),
                const FooterItem('201-207-1177'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
