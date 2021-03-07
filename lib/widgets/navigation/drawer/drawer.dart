import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeless_app/widgets/navigation/drawer/drawer_header.dart';
import 'package:timeless_app/widgets/navigation/drawer/drawer_item.dart';

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
          DrawerItem(title: 'Home', handler: () => {}),
          DrawerItem(title: 'About', handler: () => {}),
          DrawerItem(
            title: 'Search',
            handler: () {},
          ),
          DrawerItem(
            title: 'Contact',
            handler: () {},
          ),
        ],
      ),
    );
  }
}
