import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/utils/custom_section.dart';
import 'package:timeless_app/widgets/footer/footer.dart';
import 'package:timeless_app/widgets/home/landing_page_content.dart';
import 'package:timeless_app/widgets/navigation_bar/navigation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      /* TODO: I dont want to wrap the entire website in the CustomSection widget
        We don't want this because if we create wrap the entire page then some sections won't look as appealing
        due to them having background colors and not stretching the full width of the screen
      */
      body: CustomSection(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [NavigationBar(), LandingPageContent(), Footer()]),
      ),
    );
  }
}
