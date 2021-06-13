import 'dart:math';

// ignore: import_of_legacy_library_into_null_safe
import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeless_app/ui/providers/text_input_provider.dart';
import 'package:timeless_app/ui/views/about.dart';
import 'package:timeless_app/ui/views/contact.dart';
import 'package:timeless_app/ui/views/home.dart';
import 'package:timeless_app/ui/views/login.dart';
import 'package:timeless_app/ui/views/search.dart';

/// Creates a circular nav menu for the mobile app platform
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
    TextInputProvider inputProvider = Provider.of<TextInputProvider>(context);
    if (kDebugMode) {
      print('CURRENT ISFOCUSED STATE = ${inputProvider.isFocused}');
    }
    if (inputProvider.isFocused) {
      return Container();
    }
    return CircularMenu(
        // menu radius
        radius: 100,
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
              context: context),
          buildNavItem(
              icon: Icons.account_circle,
              routeName: LoginWidget.route,
              context: context)
        ]);
  }
}
