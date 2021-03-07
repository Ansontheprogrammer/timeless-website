import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar();

  buildBottomNavBarItem(
      {required BuildContext context,
      required String title,
      required IconData icon}) {
    return BottomNavigationBarItem(
      activeIcon: Icon(
        Icons.home,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(title),
      icon: Icon(icon),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black87,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      onTap: (value) {
        // Respond to item press.
        print({'value', value});
      },
      items: [
        buildBottomNavBarItem(
            context: context, title: 'Home', icon: Icons.home),
        buildBottomNavBarItem(
            context: context, title: 'Search', icon: Icons.search),
        buildBottomNavBarItem(
            context: context, title: 'About', icon: Icons.location_on),
        buildBottomNavBarItem(
            context: context, title: 'Contact', icon: Icons.contact_page),
      ],
    );
  }
}
