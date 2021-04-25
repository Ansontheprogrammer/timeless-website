import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeless_app/business_logic/enums/display_type.dart';
import 'package:timeless_app/business_logic/models/category_btn.dart';
import 'package:timeless_app/business_logic/models/query.dart';
import 'package:timeless_app/business_logic/providers/category_provider.dart';
import 'package:timeless_app/business_logic/view_models/search_view_model.dart';
import 'package:timeless_app/ui/shared/container_spacer.dart';
import 'package:timeless_app/ui/shared/custom_text.dart';
import 'package:timeless_app/ui/shared/businesses_found_in_query.dart';

class NearbyBusinessSection extends StatelessWidget {
  const NearbyBusinessSection();

  @override
  Widget build(BuildContext context) {
    QuerySearch activeSearch =
        Provider.of<SearchViewModel>(context).activeSearch;
    List<CategoryBtn> activeCategoryBtns =
        Provider.of<CategoryProvider>(context).activeCategoryBtns;
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const CustomTextCaption(
          text: 'Recommended to you',
        ),
        const ContainerSpacer(),
        SizedBox(height: 20),
        Container(
          child: BusinessesFoundInQuery(
            currentSearch: activeSearch,
            activeCategories: activeCategoryBtns,
            displayType: BusinessListDisplayType.Card,
          ),
        )
      ]),
    );
  }
}
