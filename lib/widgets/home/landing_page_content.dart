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
            color: Colors.black12,
            child: Column(
              children: [
                Center(
                  child: CustomTextCaption(
                    text: 'Categories',
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
            color: Colors.black.withOpacity(0.05),
            child: RecommendedSection(
              displayHorizontal: displayedOnTabletOrSmaller ? true : false,
            )),
      ];
    }

    return SliverList(delegate: SliverChildListDelegate(_buildWebapp()));
  }
}
