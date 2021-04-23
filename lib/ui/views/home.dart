import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:timeless_app/business_logic/providers/category_provider.dart';
import 'package:timeless_app/business_logic/view_models/search_view_model.dart';
import 'package:timeless_app/services/locator.dart';
import 'package:timeless_app/ui/shared/layout.dart';
import 'package:timeless_app/ui/widgets/home/landing_page_content.dart';

/// Creates the root view of the application
///
/// This view will pass the [CategoryProvider] and [SearchViewModel] to it's children through the [Layout] widget
class HomeView extends StatelessWidget {
  HomeView();
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ListenableProvider<SearchViewModel>(
          create: (_) => locator<SearchViewModel>()),
      ListenableProvider<CategoryProvider>(
          create: (_) => locator<CategoryProvider>())
    ], child: Layout(pageContent: LandingPageContent()));
  }
}
