import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/utils/layout.dart';
import 'package:timeless_app/widgets/home/landing_page_content.dart';

class HomeView extends StatelessWidget {
  HomeView();
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return Layout(pageContent: LandingPageContent());
  }
}
