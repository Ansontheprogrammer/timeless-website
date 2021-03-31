import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/utils/custom_section.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/widgets/home/signup/contact_form.dart';
import 'package:timeless_app/widgets/home/signup/form_container.dart';
import 'package:timeless_app/widgets/home/hero/hero_section.dart';
import 'package:timeless_app/widgets/home/signup/my_custom_form_details.dart';
import 'package:timeless_app/widgets/navigation/app/custom_tab_bar.dart';
import 'package:timeless_app/widgets/home/landing_page_content.dart';
import 'package:timeless_app/widgets/navigation/drawer/drawer.dart';
import 'package:timeless_app/widgets/navigation/footer/footer.dart';
import 'package:timeless_app/widgets/navigation/nav-bar/navigation_bar.dart';

class HomeView extends StatelessWidget {
  HomeView();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  static const String route = '/';

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void _closeDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

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
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                HeroSection(),
                CustomSection(
                    color: Colors.purple.withOpacity(0.5),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ContactForm(),
                    )),
                LandingPageContent(),
                kIsWeb ? Footer() : Positioned(bottom: 0, child: CustomTabBar())
              ],
            ),
          ),
          if (kIsWeb)
            Positioned(
              top: 0,
              child: NavigationBar(
                openDrawer: _openDrawer,
                closeDrawer: _closeDrawer,
              ),
            ),
        ],
      ),
      // bottomNavigationBar: !kIsWeb ? CustomTabBar() : Container(),
    );
  }
}
