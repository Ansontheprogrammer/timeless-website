import 'dart:math';

import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:timeless_app/ui/views/about.dart';
import 'package:timeless_app/ui/views/contact.dart';
import 'package:timeless_app/ui/views/home.dart';
import 'package:timeless_app/ui/views/search.dart';

class NavMenu extends StatelessWidget {
  const NavMenu() : super();

  buildNavItem(
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
      color: routeName == HomeView.route ? Colors.blue : Colors.purpleAccent,
      // elevation: 4.0,
      iconColor: Colors.white,
      iconSize: 30.0,
      margin: 10.0,
      padding: 10.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CircularMenu(
        // menu alignment
        alignment: Alignment.bottomCenter,
        // menu radius
        radius: 100,
        // widget in the background holds actual page content
        // global key to control the animation anywhere in the code.
        key: GlobalKey<CircularMenuState>(),
        // animation duration
        animationDuration: Duration(milliseconds: 500),
        // animation curve in forward
        curve: Curves.bounceOut,
        // animation curve in reverse
        reverseCurve: Curves.fastOutSlowIn,
        // first item angle
        startingAngleInRadian: 1.1 * pi,
        // last item angle
        endingAngleInRadian: 1.9 * pi,
        // toggle button callback
        toggleButtonOnPressed: () {
          //callback
        },
        // toggle button appearance properties
        toggleButtonColor: Theme.of(context).primaryColor,
        toggleButtonBoxShadow: [
          BoxShadow(
            color: Colors.red,
            blurRadius: 10,
          ),
        ],
        toggleButtonIconColor: Colors.white,
        toggleButtonMargin: 10.0,
        toggleButtonPadding: 10.0,
        toggleButtonSize: 40.0,
        items: [
          buildNavItem(
              icon: Icons.home, routeName: HomeView.route, context: context),
          buildNavItem(
              icon: Icons.search,
              routeName: SearchView.route,
              context: context),
          buildNavItem(
              icon: Icons.star, routeName: AboutView.route, context: context),
          buildNavItem(
              icon: Icons.contact_mail,
              routeName: ContactView.route,
              context: context)
        ]);
  }
}
