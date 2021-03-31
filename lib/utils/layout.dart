import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/widgets/navigation/app/custom_tab_bar.dart';
import 'package:timeless_app/widgets/navigation/drawer/drawer.dart';
import 'package:timeless_app/widgets/navigation/footer/footer.dart';
import 'package:timeless_app/widgets/navigation/nav-bar/navigation_bar.dart';

class Layout extends StatelessWidget {
  Layout({required this.pageContent});
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void _closeDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  final Widget pageContent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !kIsWeb
          ? AppBar(
              title:
                  CustomTextNormal(text: 'ansonervin.com', color: Colors.white),
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
                if (kIsWeb)
                  SizedBox(
                    height: 100,
                  ),
                ConstrainedBox(
                    constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height * 0.6),
                    child: pageContent),
                if (kIsWeb) Footer()
              ],
            ),
          ),
          // if (!kIsWeb) Positioned(bottom: 0, child: CustomTabBar()),
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
    );
  }
}
