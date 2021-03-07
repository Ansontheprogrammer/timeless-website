import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/widgets/footer/custom_tab_bar.dart';
import 'package:timeless_app/widgets/home/landing_page_content.dart';
import 'package:timeless_app/widgets/navigation/drawer/drawer.dart';
import 'package:timeless_app/widgets/navigation/drawer/drawer_header.dart';

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
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          if (!kIsWeb)
            Container()
          // SliverAppBar(
          //     expandedHeight: 150.0,
          //     flexibleSpace: const FlexibleSpaceBar(
          //       title: CustomTextNormal(
          //           text: 'Timeless on an App', color: Colors.white),
          //     ))
          else
            Container(),
          // SliverToBoxAdapter(
          //   child: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         kIsWeb
          //             ? NavigationBar(
          //                 openDrawer: _openDrawer,
          //                 closeDrawer: _closeDrawer,
          //               )
          //             : Container(),
          //         LandingPageContent(),
          //         kIsWeb ? Container() : CustomTabBar()
          //       ]),
          // ),
        ],
      ),
    );
  }
}
