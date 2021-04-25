import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeless_app/business_logic/models/query.dart';
import 'package:timeless_app/business_logic/view_models/search_view_model.dart';
import 'package:timeless_app/ui/shared/custom_section.dart';

import '../../shared/businesses_found_in_query.dart';

class SearchedBusinessesSection extends StatelessWidget {
  const SearchedBusinessesSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuerySearch currentSearch =
        Provider.of<SearchViewModel>(context).activeSearch;

    return CustomSection(
        color: Colors.black12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            BusinessesFoundInQuery(currentSearch: currentSearch)
          ],
        ));
  }
}
