import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/utils/custom_section.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/widgets/footer/footer.dart';
import 'package:timeless_app/widgets/home/landing_page_content.dart';
import 'package:timeless_app/widgets/navigation_bar/navigation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !kIsWeb
          ? AppBar(
              title: CustomTextNormal(
                  text: 'Timeless on an App', color: Colors.white),
              backgroundColor: Colors.black87,
            )
          : PreferredSize(
              child: Container(),
              preferredSize: Size(
                0,
                0,
              )),
      backgroundColor: Colors.white,
      body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kIsWeb ? NavigationBar() : Container(),
            LandingPageContent(),
            kIsWeb
                ? Container()
                : BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Colors.black87,
                    selectedItemColor: Colors.white,
                    unselectedItemColor: Colors.white.withOpacity(.60),
                    selectedFontSize: 14,
                    unselectedFontSize: 14,
                    onTap: (value) {
                      // Respond to item press.
                    },
                    items: [
                      BottomNavigationBarItem(
                        activeIcon: Icon(
                          Icons.home,
                          color: Theme.of(context).primaryColor,
                        ),
                        title: Text('Home'),
                        icon: Icon(Icons.home),
                      ),
                      BottomNavigationBarItem(
                        title: Text('Search'),
                        icon: Icon(Icons.search),
                      ),
                      BottomNavigationBarItem(
                        title: Text('About'),
                        icon: Icon(Icons.location_on),
                      ),
                      BottomNavigationBarItem(
                        title: Text('Contact'),
                        icon: Icon(Icons.contact_page),
                      ),
                    ],
                  )
          ]),
    );
  }
}
