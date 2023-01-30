import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:timeless_app/ui/widgets/home/signup/form_container.dart';
import 'package:timeless_app/ui/widgets/home/signup/custom_form_details.dart';

/// Creates a contact form for the home view.
class ContactForm extends StatelessWidget {
  const ContactForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool displayedOnTabletOrSmaller = screenWidth < 600;

    return Container(
        margin: EdgeInsets.only(
            right: !displayedOnTabletOrSmaller
                ? MediaQuery.of(context).size.width * 0.1
                : 0,
            left: !displayedOnTabletOrSmaller
                ? MediaQuery.of(context).size.width * 0.1
                : 0),
        child: ClipRect(
          child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 36.0,
                sigmaY: 36.0,
              ),
              child: Container(
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: FormContainer(child: ContactFormDetails(true)))),
        ));
  }
}
