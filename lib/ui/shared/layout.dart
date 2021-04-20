import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/ui/shared/custom_color.dart';
import 'package:timeless_app/ui/shared/custom_text.dart';
import 'package:timeless_app/ui/views/about.dart';
import 'package:timeless_app/ui/views/contact.dart';
import 'package:timeless_app/ui/views/home.dart';
import 'package:timeless_app/ui/views/search.dart';
import 'package:timeless_app/ui/widgets/navigation/app/circular_nav.dart';
import 'package:timeless_app/ui/widgets/navigation/drawer/drawer.dart';
import 'package:timeless_app/ui/widgets/navigation/footer/footer.dart';
import 'package:timeless_app/ui/widgets/navigation/nav-bar/mobile_nav_item.dart';
import 'package:timeless_app/ui/widgets/navigation/nav-bar/navigation_bar.dart';

class Layout extends StatefulWidget {
  Layout({required this.pageContent});
  final Widget pageContent;

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  bool displayMobileMenu = false;
  bool appMenuOpened = false;

  toggleMobileMenu() {
    setState(() {
      displayMobileMenu = !displayMobileMenu;
    });
  }

  toggleAppMenu() {
    print({appMenuOpened, 'appMenuOpened'});
    setState(() {
      appMenuOpened = !appMenuOpened;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      backgroundColor:
          kIsWeb ? Colors.white : CustomColor.getColorHexCode('#F2F2F2'),
      body: Container(
        child: SafeArea(
          child: Stack(
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
                            minHeight:
                                MediaQuery.of(context).size.height * 0.6),
                        child: widget.pageContent),
                    if (kIsWeb) Footer()
                  ],
                ),
              ),
              if (kIsWeb && displayMobileMenu)
                Container(
                  color: Colors.black.withOpacity(0.95),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MobileNavItem('Home', HomeView.route),
                          MobileNavItem('Search', SearchView.route),
                          MobileNavItem('About', AboutView.route),
                          MobileNavItem('Contact', ContactView.route),
                        ],
                      ),
                    ),
                  ),
                ),
              // if (kIsWeb) Positioned(bottom: 0, child: CustomTabBar()),
              if (!kIsWeb)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(height: 200, width: 400, child: NavMenu()),
                ),
              if (kIsWeb)
                Positioned(
                  top: 0,
                  child: NavigationBar(
                    toggleMobileMenu: toggleMobileMenu,
                    openDrawer: _openDrawer,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
