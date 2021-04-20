import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:timeless_app/enums/business_search.dart';
import 'package:timeless_app/ui/shared/container_spacer.dart';
import 'package:timeless_app/ui/shared/custom_color.dart';
import 'package:timeless_app/ui/shared/custom_section.dart';
import 'package:timeless_app/ui/shared/custom_text.dart';
import 'package:timeless_app/ui/shared/small_spacer.dart';
import 'package:timeless_app/ui/widgets/home/hero/hero_section.dart';
import 'package:timeless_app/ui/widgets/home/recommended/category_option_btns/category_list.dart';
import 'package:timeless_app/ui/widgets/home/recommended/recommended_section.dart';
import 'package:timeless_app/ui/widgets/home/signup/contact_form.dart';

import 'hero/search_bar.dart';

class LandingPageContent extends StatelessWidget {
  const LandingPageContent();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool displayedOnTabletOrSmaller = screenWidth < 600;

    return Column(
      children: [
        if (kIsWeb) HeroSection(),
        CustomSection(
            color: kIsWeb
                ? Colors.black12
                : CustomColor.getColorHexCode('#F2F2F2'),
            child: CenterColumnOnWeb(
              children: [
                CenterWidgetOnWeb(
                  child: CustomTextHeadline(
                    fontSize: 48.0,
                    fontWeight: kIsWeb ? FontWeight.normal : FontWeight.bold,
                    text: 'Categories',
                  ),
                ),
                SizedBox(height: 20),
                CenterWidgetOnWeb(
                  child: Container(
                    width: !displayedOnTabletOrSmaller
                        ? MediaQuery.of(context).size.width * 0.5
                        : MediaQuery.of(context).size.width * 0.8,
                    child: CustomTextLarge(
                      textAlign: kIsWeb ? TextAlign.center : TextAlign.start,
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
        if (!kIsWeb)
          CustomSection(
            child: CenterColumnOnWeb(
              children: [
                Container(
                  child: const SearchBar(
                    noBorder: true,
                    type: BusinessSearchTypes.Description,
                  ),
                ),
              ],
            ),
          ),
        CustomSection(
            color: kIsWeb
                ? Colors.black.withOpacity(0.1)
                : CustomColor.getColorHexCode('#F2F2F2'),
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

class CenterColumnOnWeb extends StatelessWidget {
  final List<Widget> children;
  const CenterColumnOnWeb({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          kIsWeb ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: this.children,
    );
  }
}

class CenterWidgetOnWeb extends StatelessWidget {
  final Widget child;
  const CenterWidgetOnWeb({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kIsWeb)
      return Center(child: child);
    else {
      return child;
    }
  }
}
