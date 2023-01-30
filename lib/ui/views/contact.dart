import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/business_logic/models/business.dart';
import 'package:timeless_app/ui/shared/adaptive/adaptive_center.dart';
import 'package:timeless_app/ui/shared/adaptive/adaptive_column.dart';
import 'package:timeless_app/ui/shared/utils/custom_text.dart';
import 'package:timeless_app/ui/shared/adaptive/layout.dart';
import 'package:timeless_app/ui/widgets/home/signup/custom_form_details.dart';

/// Creates a view to process new businesses that want to join the app.
///
/// Uses the [Business] model to create new businesses if the contact form is filled out correctly.
class ContactView extends StatelessWidget {
  ContactView();
  static const String route = '/contact';

  @override
  Widget build(BuildContext context) {
    return Layout(
        pageContent: Column(
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage("assets/images/hero.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.2), BlendMode.dstATop),
                )),
            padding: EdgeInsets.all(25.0),
            child: AdaptiveColumn(
              children: [
                CustomTextHeadline(
                  fontSize: 72.0,
                  fontWeight: kIsWeb ? FontWeight.normal : FontWeight.bold,
                  text: 'Add a business?',
                  color: Colors.white,
                ),
                SizedBox(
                  height: 32.0,
                ),
                SizedBox(
                  height: 25,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: ContactFormDetails(false),
                ),
              ],
            )),
      ],
    ));
  }
}
