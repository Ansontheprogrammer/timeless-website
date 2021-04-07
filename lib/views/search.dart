import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/utils/custom_section.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/utils/layout.dart';
import 'package:timeless_app/widgets/home/hero/search_bar.dart';

class SearchView extends StatelessWidget {
  SearchView();
  static const String route = '/search';

  @override
  Widget build(BuildContext context) {
    return Layout(
        pageContent: Column(
      children: [
        CustomSection(
            color: Colors.purple.withOpacity(0.5),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                children: [
                  SearchBar(),
                ],
              ),
            )),
      ],
    ));
  }
}
