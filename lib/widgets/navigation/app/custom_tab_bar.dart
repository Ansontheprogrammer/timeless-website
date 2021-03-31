import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/views/about_view.dart';
import 'package:timeless_app/views/contact.dart';
import 'package:timeless_app/views/home_view.dart';
import 'package:timeless_app/views/search_view.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar();

  buildBottomNavBarItem(
      {required BuildContext context,
      required String title,
      required IconData icon,
      required routeName}) {
    return BottomNavigationBarItem(
      activeIcon: Icon(
        Icons.home,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(title),
      icon: IconButton(
          onPressed: () => {Navigator.pushReplacementNamed(context, routeName)},
          icon: Icon(icon)),
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
        print({'value', value});
      },
      items: [
        buildBottomNavBarItem(
            context: context,
            title: 'Home',
            icon: Icons.home,
            routeName: HomeView.route),
        buildBottomNavBarItem(
            context: context,
            title: 'Search',
            icon: Icons.search,
            routeName: SearchView.route),
        buildBottomNavBarItem(
            context: context,
            title: 'About',
            icon: Icons.location_on,
            routeName: AboutView.route),
        buildBottomNavBarItem(
            context: context,
            title: 'Contact',
            icon: Icons.contact_page,
            routeName: ContactView.route),
      ],
    );
  }
}
