import 'package:flutter/material.dart';
import 'package:timeless_app/utils/custom_section.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/utils/small_spacer.dart';
import 'package:timeless_app/widgets/home/recommended/category_option_btns/category_list.dart';
import 'package:timeless_app/widgets/home/recommended/desktop_recommended_section.dart';
import 'package:timeless_app/widgets/home/recommended/mobile_recommended_section.dart';
import 'package:timeless_app/widgets/navigation/footer/footer.dart';

class LandingPageContent extends StatelessWidget {
  const LandingPageContent();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool displayedOnTabletOrSmaller = screenWidth < 600;

    List<Widget> _buildWebapp() {
      return [
        CustomSection(
            child: Column(
          children: [
            Center(
              child: CustomTextCaption(
                text: 'Categories',
              ),
            ),
            SmallSpacer(),
            CategoryListButtons()
          ],
        )),
        CustomSection(
          color: Colors.white,
          child: !displayedOnTabletOrSmaller
              ? DesktopRecommendedSection()
              : MobileRecommendSection(),
        ),
      ];
    }

    return SliverList(delegate: SliverChildListDelegate(_buildWebapp()));
  }
}
