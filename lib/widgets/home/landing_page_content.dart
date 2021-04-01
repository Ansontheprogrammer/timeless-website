import 'package:flutter/material.dart';
import 'package:timeless_app/utils/custom_section.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/utils/small_spacer.dart';
import 'package:timeless_app/widgets/home/hero/hero_section.dart';
import 'package:timeless_app/widgets/home/recommended/category_option_btns/category_list.dart';
import 'package:timeless_app/widgets/home/recommended/recommended_section.dart';
import 'package:timeless_app/widgets/home/signup/contact_form.dart';

class LandingPageContent extends StatelessWidget {
  const LandingPageContent();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool displayedOnTabletOrSmaller = screenWidth < 600;

    return Column(
      children: [
        HeroSection(),
        CustomSection(
            color: Colors.black12,
            child: Column(
              children: [
                Center(
                  child: CustomTextHeadline(
                    fontSize: 48.0,
                    text: 'Categories',
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Container(
                    width: !displayedOnTabletOrSmaller
                        ? MediaQuery.of(context).size.width * 0.5
                        : MediaQuery.of(context).size.width * 0.8,
                    child: CustomTextLarge(
                      textAlign: TextAlign.center,
                      text:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labor',
                    ),
                  ),
                ),
                SmallSpacer(),
                Container(
                    width: !displayedOnTabletOrSmaller
                        ? MediaQuery.of(context).size.width * 0.65
                        : MediaQuery.of(context).size.width,
                    child: CategoryListButtons())
              ],
            )),
        CustomSection(
            color: Colors.black.withOpacity(0.1),
            child: RecommendedSection(
              displayHorizontal: displayedOnTabletOrSmaller ? true : false,
            )),
        CustomSection(
            color: Colors.purple.withOpacity(0.5),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ContactForm(),
            )),
      ],
    );
  }
}
