import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/ui/shared/utils/custom_color.dart';
import 'package:timeless_app/ui/shared/utils/custom_text.dart';
import 'package:timeless_app/ui/views/about.dart';
import 'package:timeless_app/ui/views/contact.dart';
import 'package:timeless_app/ui/views/detail.dart';
import 'package:timeless_app/ui/views/home.dart';
import 'package:timeless_app/ui/views/search.dart';
import 'package:timeless_app/ui/widgets/layout/scrollable_page_content.dart';
import 'package:timeless_app/ui/widgets/navigation/app/circular_nav.dart';
import 'package:timeless_app/ui/widgets/navigation/nav-bar/mobile_nav_item.dart';
import 'package:timeless_app/ui/widgets/navigation/nav-bar/navigation_bar.dart';

/// Creates a consistent layout used by all views. This will dynamically show the platforms respective menus.
///
///
/// The layout builds the view by creating a [Stack] within a [SafeArea].
/// The [Stack] enables us to create the respective menu functionality :
///
/// A sticky nav bar on desktop.
///
/// A floating menu button on the mobile app view.
///
/// Different navigation displays:
///
/// On the mobile web we want to show the full screen menu
///
/// On the mobile app we want to show the circular app menu
///
/// On desktop we want to show a sticky navigation menu
class Layout extends StatefulWidget {
  Layout({required this.pageContent});
  final Widget pageContent;

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  bool displayMobileMenu = false;
  bool appMenuOpened = false;

  toggleMobileMenu() {
    setState(() {
      displayMobileMenu = !displayMobileMenu;
    });
  }

  toggleAppMenu() {
    setState(() {
      appMenuOpened = !appMenuOpened;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool displayedOnTabletOrSmaller = screenWidth < 600;

    return Scaffold(
      /// We want to show an app bar if on the mobile app platform and on detail screen
      appBar: !kIsWeb &&
              ModalRoute.of(context)!.settings.name!.contains(DetailView.route)
          ? AppBar(
              automaticallyImplyLeading: true,
              title: CustomTextNormal(
                fontWeight: FontWeight.bold,
                text: 'Business Detail',
              ),
            )
          : PreferredSize(
              child: SizedBox(
                height: 10,
              ),
              preferredSize: Size(0, 0)),
      backgroundColor:
          kIsWeb ? Colors.white : CustomColor.mobileAppPrimaryBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            ScrollablePageContent(widget: widget),
            if (kIsWeb && displayMobileMenu && displayedOnTabletOrSmaller)
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
                ),
              ),
          ],
        ),
      ),
    );
  }
}
