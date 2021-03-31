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
  final Function closeDrawer;

  const NavigationBar({required this.openDrawer, required this.closeDrawer});

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
                      const NavBarItem('Home', HomeView.route),
                      const NavBarItem('Search', SearchView.route),
                      const NavBarItem('About', AboutView.route),
                      const NavBarItem('Contact', ContactView.route),
                    ],
                  )
                : IconButton(
                    onPressed: () {
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
