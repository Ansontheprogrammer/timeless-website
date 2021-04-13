import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/ui/shared/custom_section.dart';
import 'package:timeless_app/ui/shared/custom_text.dart';
import 'package:timeless_app/ui/shared/small_spacer.dart';
import 'package:timeless_app/ui/views/about.dart';
import 'package:timeless_app/ui/views/contact.dart';
import 'package:timeless_app/ui/widgets/navigation/footer/footer_item.dart';
import 'package:timeless_app/ui/widgets/navigation/footer/footer_nav_item.dart';

class Footer extends StatelessWidget {
  const Footer();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool displayedOnTabletOrSmaller = screenWidth < 600;

    return CustomSection(
      color: Colors.black87,
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: !displayedOnTabletOrSmaller
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.asset('assets/images/logo.png'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: CustomTextNormal(
                          color: Colors.white,
                          text:
                              """AnsonErvin Inc. is a software development company. We provide startups and small businesses with an affordable option for various software products.""",
                        ),
                      )
                    ],
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
                      const FooterNavItem('About', AboutView.route),
                      const FooterNavItem('Contact', ContactView.route),
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
              )
            : Column(
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
                      const FooterNavItem('About', AboutView.route),
                      const FooterNavItem('Contact', ContactView.route),
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
