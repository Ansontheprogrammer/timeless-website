import 'package:flutter/widgets.dart';
import 'package:timeless_app/utils/custom_section.dart';
import 'package:timeless_app/widgets/navigation_bar/nav_item.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomSection(
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
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const NavBarItem('Home'),
                const NavBarItem('Search'),
                const NavBarItem('About'),
                const NavBarItem('Contact'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
