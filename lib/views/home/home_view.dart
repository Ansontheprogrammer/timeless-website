import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/widgets/footer/custom_tab_bar.dart';
import 'package:timeless_app/widgets/home/landing_page_content.dart';
import 'package:timeless_app/widgets/navigation_bar/navigation_bar.dart';

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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextLarge(
                        text: 'AnsonErvin Inc.', color: Colors.white)
                  ]),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            ListTile(
              title: CustomTextNormal(text: 'Home'),
              onTap: () {},
            ),
            ListTile(
              title: CustomTextNormal(text: 'About'),
              onTap: () {},
            ),
            ListTile(
              title: CustomTextNormal(text: 'Search'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Contact'),
              onTap: () {},
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          if (!kIsWeb)
            SliverAppBar(
                expandedHeight: 150.0,
                flexibleSpace: const FlexibleSpaceBar(
                  title: CustomTextNormal(
                      text: 'Timeless on an App', color: Colors.white),
                ))
          else
            Container(),
          SliverToBoxAdapter(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kIsWeb
                      ? NavigationBar(
                          openDrawer: _openDrawer,
                          closeDrawer: _closeDrawer,
                        )
                      : Container(),
                  LandingPageContent(),
                  kIsWeb ? Container() : CustomTabBar()
                ]),
          ),
        ],
      ),
    );
  }
}
