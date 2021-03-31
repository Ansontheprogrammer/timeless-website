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
      body: CustomScrollView(
        slivers: [
          if (kIsWeb)
            SliverToBoxAdapter(
                child: NavigationBar(
              openDrawer: _openDrawer,
              closeDrawer: _closeDrawer,
            )),
          SliverToBoxAdapter(
            child: HeroSection(),
          ),
          LandingPageContent(),
          SliverToBoxAdapter(
            child: CustomSection(
                color: Colors.purple.withOpacity(0.5),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ContactForm(),
                )),
          ),
          if (kIsWeb) SliverToBoxAdapter(child: Footer()),
          SliverToBoxAdapter(
            child: !kIsWeb ? CustomTabBar() : Container(),
          ),
        ],
      ),
    );
  }
}
