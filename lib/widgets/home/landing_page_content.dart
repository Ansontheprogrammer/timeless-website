import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:timeless_app/utils/custom_section.dart';
import 'package:timeless_app/widgets/home/hero/hero_section.dart';
import 'package:timeless_app/widgets/home/my_custom_form.dart';
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
        HeroSection(),
        CustomSection(
          color: Colors.white,
          child: !displayedOnTabletOrSmaller
              ? DesktopRecommendedSection()
              : MobileRecommendSection(),
        ),
        CustomSection(child: MyCustomForm()),
        if (kIsWeb) Footer() else Container()
      ];
    }

    return SliverList(delegate: SliverChildListDelegate(_buildWebapp()));
  }
}
