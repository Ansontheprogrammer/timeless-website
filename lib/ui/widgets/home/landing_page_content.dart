import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeless_app/business_logic/enums/business_search.dart';
import 'package:timeless_app/services/auth_service.dart';
import 'package:timeless_app/ui/shared/constants.dart';
import 'package:timeless_app/ui/shared/adaptive/adaptive_center.dart';
import 'package:timeless_app/ui/shared/utils/custom_color.dart';
import 'package:timeless_app/ui/shared/utils/custom_section.dart';
import 'package:timeless_app/ui/shared/utils/custom_text.dart';
import 'package:timeless_app/ui/shared/utils/small_spacer.dart';
import 'package:timeless_app/ui/widgets/home/hero/hero_section.dart';
import 'package:timeless_app/ui/widgets/home/recommended/category_option_btns/category_list.dart';
import 'package:timeless_app/ui/widgets/home/recommended/recommended_section.dart';
import 'package:timeless_app/ui/widgets/home/signup/contact_form.dart';

import '../../shared/adaptive/adaptive_column.dart';
import 'hero/search_bar.dart';

class LandingPageContent extends StatelessWidget {
  const LandingPageContent();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool displayedOnTabletOrSmaller = screenWidth < 600;
    AuthenticationService authenticationService =
        Provider.of<AuthenticationService>(context);
    return Column(
      children: [
        if (kIsWeb) HeroSection(),
        CustomSection(
            color: kIsWeb
                ? Constants.blackLargeOpacity
                : CustomColor.mobileAppPrimaryBackgroundColor,
            child: AdaptiveColumn(
              children: [
                AdaptiveCenter(
                  child: CustomTextHeadline(
                    fontSize: kIsWeb ? 48.0 : null,
                    fontWeight: kIsWeb ? FontWeight.normal : FontWeight.bold,
                    text: 'Categories',
                  ),
                ),
                SizedBox(height: 20),
                AdaptiveCenter(
                  child: Container(
                    width: !displayedOnTabletOrSmaller
                        ? MediaQuery.of(context).size.width * 0.5
                        : MediaQuery.of(context).size.width * 0.8,
                    child: CustomTextNormal(
                      fontSize: 14,
                      textAlign: kIsWeb ? TextAlign.center : TextAlign.start,
                      text: 'See businesses based on your preferred categories',
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
            child: AdaptiveColumn(
              children: [
                Container(
                  child: const SearchBar(
                    noBorder: true,
                    type: BusinessSearchTypes.Name,
                  ),
                ),
              ],
            ),
          ),
        CustomSection(
            color: kIsWeb
                ? Colors.black.withOpacity(0.1)
                : CustomColor.mobileAppPrimaryBackgroundColor,
            child: RecommendedSection(
              displayHorizontal: displayedOnTabletOrSmaller ? true : false,
            )),
        // if (authenticationService.isUserLoggedIn())
        CustomSection(
            color: Colors.purple.withOpacity(0.5),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ContactForm(),
            ))
      ],
    );
  }
}
