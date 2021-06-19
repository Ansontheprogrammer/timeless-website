import 'dart:math';

// ignore: import_of_legacy_library_into_null_safe
import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeless_app/services/auth_service.dart';
import 'package:timeless_app/ui/views/about.dart';
import 'package:timeless_app/ui/views/contact.dart';
import 'package:timeless_app/ui/views/home.dart';
import 'package:timeless_app/ui/views/login.dart';
import 'package:timeless_app/ui/views/search.dart';

/// Creates a circular nav menu for the mobile app platform
class NavMenu extends StatelessWidget {
  const NavMenu() : super();

  CircularMenuItem buildNavItem(
      {required IconData icon,
      required String routeName,
      required BuildContext context}) {
    return CircularMenuItem(
      // menu item callback
      onTap: () => {
        if (kDebugMode) {print('Tap registered. Navigating to $routeName')},
        Navigator.pushReplacementNamed(context, routeName)
      },
      // menu item appearance properties
      icon: icon,
      color: ModalRoute.of(context)!.settings.name == routeName
          ? Colors.blue
          : Colors.purpleAccent,
      iconColor: Colors.white,
      iconSize: 30.0,
      margin: 10.0,
      padding: 10.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    AuthenticationService authService =
        Provider.of<AuthenticationService>(context);

    Map<String, IconData> routesToUseAuthenticated = {
      HomeView.route: Icons.home,
      SearchView.route: Icons.search,
      AboutView.route: Icons.star,
      ContactView.route: Icons.contact_mail,
    };
    Map<String, IconData> routesToUseNotAuthenticated = {
      HomeView.route: Icons.home,
      SearchView.route: Icons.search,
      AboutView.route: Icons.star,
      LoginWidget.route: Icons.account_circle,
    };
    Map<String, IconData> routesToUse;
    if (authService.isUserLoggedIn()) {
      routesToUse = routesToUseAuthenticated;
    } else
      routesToUse = routesToUseNotAuthenticated;

    return CircularMenu(
        // menu radius
        radius: 125,
        key: GlobalKey<CircularMenuState>(),
        // animation duration
        animationDuration: Duration(milliseconds: 500),
        // animation curve in forward
        curve: Curves.bounceOut,
        // animation curve in reverse
        reverseCurve: Curves.fastOutSlowIn,
        // first item angle
        startingAngleInRadian: 1.5 * pi,
        // last item angle
        endingAngleInRadian: 1.95 * pi,
        toggleButtonColor: Theme.of(context).primaryColor,
        toggleButtonBoxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
          ),
        ],
        toggleButtonIconColor: Colors.white,
        toggleButtonMargin: 10.0,
        toggleButtonPadding: 10.0,
        toggleButtonSize: 40.0,
        items: routesToUse.keys.map((key) {
          return buildNavItem(
              icon: routesToUse[key]!, routeName: key, context: context);
        }).toList());
  }
}

class NavIconOptions {
  Icon icon;
  String routeName;
  NavIconOptions({required this.icon, required this.routeName});
}
