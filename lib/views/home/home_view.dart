import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/utils/custom_section.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/widgets/footer/custom_tab_bar.dart';
import 'package:timeless_app/widgets/footer/footer.dart';
import 'package:timeless_app/widgets/home/landing_page_content.dart';
import 'package:timeless_app/widgets/navigation_bar/navigation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !kIsWeb
          ? AppBar(
              title: CustomTextNormal(
                  text: 'Timeless on an App', color: Colors.white),
              backgroundColor: Colors.black87,
            )
          : PreferredSize(
              child: Container(),
              preferredSize: Size(
                0,
                0,
              )),
      backgroundColor: Colors.white,
      body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kIsWeb ? NavigationBar() : Container(),
            LandingPageContent(),
            kIsWeb ? Container() : CustomTabBar()
          ]),
    );
  }
}
