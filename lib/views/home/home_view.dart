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
              title: CustomTextNormal(text: 'Timeless on an App'),
            )
          : null,
      backgroundColor: Colors.white,
      body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [NavigationBar(), LandingPageContent()]),
      bottomNavigationBar: !kIsWeb
          ? BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color(0xFF6200EE),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white.withOpacity(.60),
              selectedFontSize: 14,
              unselectedFontSize: 14,
              onTap: (value) {
                // Respond to item press.
              },
              items: [
                BottomNavigationBarItem(
                  title: Text('Favorites'),
                  icon: Icon(Icons.favorite),
                ),
                BottomNavigationBarItem(
                  title: Text('Music'),
                  icon: Icon(Icons.music_note),
                ),
                BottomNavigationBarItem(
                  title: Text('Places'),
                  icon: Icon(Icons.location_on),
                ),
                BottomNavigationBarItem(
                  title: Text('News'),
                  icon: Icon(Icons.library_books),
                ),
              ],
            )
          : null,
    );
  }
}
