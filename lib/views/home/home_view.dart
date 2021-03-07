import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/widgets/navigation/app/custom_tab_bar.dart';
import 'package:timeless_app/widgets/home/landing_page_content.dart';
import 'package:timeless_app/widgets/navigation/drawer/drawer.dart';
import 'package:timeless_app/widgets/navigation/drawer/drawer_header.dart';
import 'package:timeless_app/widgets/navigation/nav-bar/navigation_bar.dart';

class HomeView extends StatelessWidget {
  HomeView();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void _closeDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          if (!kIsWeb) Container() else Container(),
          SliverToBoxAdapter(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (kIsWeb)
                    NavigationBar(
                      openDrawer: _openDrawer,
                      closeDrawer: _closeDrawer,
                    )
                  else
                    Container(),
                  LandingPageContent(),
                  kIsWeb ? Container() : CustomTabBar()
                ]),
          ),
        ],
      ),
    );
  }
}
