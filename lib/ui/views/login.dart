import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/ui/shared/adaptive/layout.dart';
import 'package:timeless_app/ui/widgets/home/landing_page_content.dart';

/// Used for admin authentication
///
/// This access allows the admin to add new businesses to the listing.
class HomeView extends StatelessWidget {
  HomeView();
  static const String route = '/';
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Layout(
        pageContent: Column(
      children: [
        TextFormField(
          controller: emailController,
        ),
        TextFormField(
          controller: passwordController,
        )
      ],
    ));
  }
}
