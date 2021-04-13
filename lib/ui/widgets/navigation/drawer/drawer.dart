import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeless_app/ui/views/about.dart';
import 'package:timeless_app/ui/views/contact.dart';
import 'package:timeless_app/ui/views/home.dart';
import 'package:timeless_app/ui/views/search.dart';
import 'package:timeless_app/ui/widgets/navigation/drawer/drawer_header.dart';
import 'package:timeless_app/ui/widgets/navigation/nav-bar/nav_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeaderWidget(),
          NavBarItem(
            title: 'Home',
            routeName: HomeView.route,
            color: Colors.black,
          ),
          NavBarItem(
            title: 'About',
            routeName: AboutView.route,
            color: Colors.black,
          ),
          NavBarItem(
            title: 'Search',
            routeName: SearchView.route,
            color: Colors.black,
          ),
          NavBarItem(
            title: 'Contact',
            routeName: ContactView.route,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
