import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/utils/custom_section.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/utils/layout.dart';
import 'package:timeless_app/widgets/home/signup/contact_form.dart';
import 'package:timeless_app/widgets/home/signup/form_container.dart';
import 'package:timeless_app/widgets/home/signup/my_custom_form_details.dart';

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
            child: Column(
              children: [
                CustomTextHeadline(
                  fontSize: 72.0,
                  text: 'Contact',
                  color: Colors.white,
                ),
                SizedBox(
                  height: 32.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: CustomTextNormal(
                      color: Colors.white,
                      textAlign: TextAlign.center,
                      text:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et do magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),
                ),
                SizedBox(
                  height: 15,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 300),
                  child: MyCustomForm(),
                ),
              ],
            )),
      ],
    ));
  }
}
