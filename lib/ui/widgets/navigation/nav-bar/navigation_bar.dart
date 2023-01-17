import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/ui/shared/utils/custom_section.dart';
import 'package:timeless_app/ui/views/about.dart';
import 'package:timeless_app/ui/views/contact.dart';
import 'package:timeless_app/ui/views/home.dart';
import 'package:timeless_app/ui/views/search.dart';
import 'package:timeless_app/ui/widgets/navigation/nav-bar/nav_item.dart';

class NavigationBar extends StatelessWidget {
  final void Function() toggleMobileMenu;

  const NavigationBar({required this.toggleMobileMenu});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool displayedOnTabletOrSmaller = screenWidth < 600;

    return CustomSection(
      color: Colors.black87,
      child: Container(
        height: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: Image.asset('assets/images/logo.png'),
            ),
            if (!displayedOnTabletOrSmaller)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const NavBarItem(title: 'Home', routeName: HomeView.route),
                  const NavBarItem(
                      title: 'Search', routeName: SearchView.route),
                  const NavBarItem(title: 'About', routeName: AboutView.route),
                  const NavBarItem(
                      title: 'Contact', routeName: ContactView.route),
                ],
              ),
            if (displayedOnTabletOrSmaller)
              IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 32,
                  ),
                  onPressed: toggleMobileMenu)
          ],
        ),
      ),
    );
  }
}
