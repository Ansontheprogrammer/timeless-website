import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/utils/custom_section.dart';
import 'package:timeless_app/views/about_view.dart';
import 'package:timeless_app/views/contact.dart';
import 'package:timeless_app/views/home_view.dart';
import 'package:timeless_app/views/search_view.dart';
import 'package:timeless_app/widgets/navigation/nav-bar/nav_item.dart';

class NavigationBar extends StatelessWidget {
  final Function openDrawer;
  final Function toggleMobileMenu;

  const NavigationBar(
      {required this.openDrawer, required this.toggleMobileMenu});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool showMobileNav = screenWidth < 600 && kIsWeb;

    return CustomSection(
      color: Colors.black87,
      child: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: Image.asset('assets/images/logo.png'),
            ),
            !showMobileNav
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const NavBarItem(
                          title: 'Home', routeName: HomeView.route),
                      const NavBarItem(
                          title: 'Search', routeName: SearchView.route),
                      const NavBarItem(
                          title: 'About', routeName: AboutView.route),
                      const NavBarItem(
                          title: 'Contact', routeName: ContactView.route),
                    ],
                  )
                : IconButton(
                    onPressed: () {
                      if (showMobileNav)
                        return toggleMobileMenu();
                      else
                        openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ))
          ],
        ),
      ),
    );
  }
}
