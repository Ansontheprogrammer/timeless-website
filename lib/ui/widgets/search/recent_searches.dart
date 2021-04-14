import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeless_app/business_logic/models/query.dart';
import 'package:timeless_app/business_logic/view_models/search_view_model.dart';
import 'package:timeless_app/ui/shared/custom_section.dart';

import 'businesses_found_in_query.dart';

class RecentSearches extends StatelessWidget {
  const RecentSearches({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuerySearch currentSearch = Provider.of<SearchViewModel>(context).search;
    return CustomSection(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        // BusinessesFoundInQuery(currentSearch: currentSearch)
      ],
    ));
  }
}
