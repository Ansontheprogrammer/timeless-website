import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/utils/layout.dart';
import 'package:timeless_app/views/contact.dart';

class AboutView extends StatelessWidget {
  AboutView();
  static const String route = '/about';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool displayedOnTabletOrSmaller = screenWidth < 600;
    return Layout(
        pageContent: Column(
      children: [
        ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(25.0),
                width: !displayedOnTabletOrSmaller
                    ? MediaQuery.of(context).size.width * 0.5
                    : MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextHeadline(
                      fontSize: 72.0,
                      fontWeight: FontWeight.w800,
                      text: 'About',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomTextLarge(
                      fontSize: 36.0,
                      fontWeight: FontWeight.w100,
                      text:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et ',
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    CustomTextNormal(
                      fontWeight: FontWeight.w100,
                      text:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et do magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum',
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    CustomTextNormal(
                      fontWeight: FontWeight.w100,
                      text:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et do magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum',
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, ContactView.route);
                          },
                          child: CustomTextBtn(
                            text: 'Get Started',
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              if (!displayedOnTabletOrSmaller)
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1520607162513-77705c0f0d4a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=749&q=80',
                    fit: BoxFit.cover,
                  ),
                )
            ],
          ),
        )
      ],
    ));
  }
}
