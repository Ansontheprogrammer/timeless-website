import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:timeless_app/utils/container_spacer.dart';
import 'package:timeless_app/utils/custom_section.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/widgets/footer/footer.dart';
import 'package:timeless_app/widgets/home/hero.dart';
import 'package:timeless_app/widgets/home/my_custom_form.dart';
import 'package:timeless_app/widgets/home/recommended/recommended_section.dart';
import 'package:timeless_app/widgets/home/search_bar.dart';

class LandingPageContent extends StatelessWidget {
  const LandingPageContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool displayedOnTabletOrSmaller = screenWidth < 600;

    return Expanded(
        flex: 5,
        child: ListView(
          children: [
            CustomHeroSection(
              child: Container(
                margin: EdgeInsets.only(bottom: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomTextHeadline(
                            color: Colors.white,
                            fontSize: 72.0,
                            text: 'Let',
                          ),
                          const CustomTextHeadline(
                            color: Colors.white,
                            text: 'me help you find',
                          ),
                          const CustomTextHeadline(
                            color: Colors.white,
                            text: 'a good local business',
                          ),
                        ],
                      ),
                    ),
                    ContainerSpacer(),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: const SearchBar(),
                    )
                  ],
                ),
              ),
            ),
            CustomSection(
              color: Colors.white,
              child: !displayedOnTabletOrSmaller
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 4, child: LeftColumnRecommended()),
                        SizedBox(
                          width: 50,
                        ),
                        Expanded(
                            flex: 2,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextCaption(
                                    text: 'New',
                                  ),
                                  ContainerSpacer(),
                                  CustomTextNormal(
                                    text:
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                  ),
                                ],
                              ),
                            )),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LeftColumnRecommended(),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextCaption(
                                text: 'New',
                              ),
                              ContainerSpacer(),
                              CustomTextNormal(
                                text:
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                              ),
                            ],
                          ),
                        ),
                        // CustomTextNormal(
                        //   text:
                        //       'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        // ),
                      ],
                    ),
            ),
            CustomSection(child: MyCustomForm()),
            kIsWeb ? Footer() : Container()
          ],
        ));
  }
}
