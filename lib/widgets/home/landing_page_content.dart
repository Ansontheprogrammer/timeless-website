import 'package:flutter/material.dart';
import 'package:timeless_app/utils/custom_section.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/utils/small_spacer.dart';
import 'package:timeless_app/widgets/home/recommended/category_option_btns/category_list.dart';
import 'package:timeless_app/widgets/home/recommended/recommended_section.dart';

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
            child: RecommendedSection(
              displayHorizontal: displayedOnTabletOrSmaller ? true : false,
            )),
      ];
    }

    return SliverList(delegate: SliverChildListDelegate(_buildWebapp()));
  }
}
