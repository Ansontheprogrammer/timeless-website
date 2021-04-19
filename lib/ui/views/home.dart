import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:timeless_app/business_logic/view_models/category_view_model.dart';
import 'package:timeless_app/business_logic/view_models/search_view_model.dart';
import 'package:timeless_app/ui/shared/layout.dart';
import 'package:timeless_app/ui/widgets/home/landing_page_content.dart';

class HomeView extends StatelessWidget {
  HomeView();
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ListenableProvider<SearchViewModel>(create: (_) => SearchViewModel()),
      ListenableProvider<CategoryViewModel>(create: (_) => CategoryViewModel())
    ], child: Layout(pageContent: LandingPageContent()));
  }
}
