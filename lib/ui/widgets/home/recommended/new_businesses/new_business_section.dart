import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeless_app/business_logic/models/category_btn.dart';
import 'package:timeless_app/business_logic/models/query.dart';
import 'package:timeless_app/business_logic/providers/category_provider.dart';
import 'package:timeless_app/business_logic/view_models/search_view_model.dart';
import 'package:timeless_app/ui/shared/utils/medium_spacer.dart';
import 'package:timeless_app/ui/shared/utils/custom_text.dart';
import 'package:timeless_app/ui/shared/businesses_found_in_query.dart';

class RecommendedNewBusinesses extends StatelessWidget {
  const RecommendedNewBusinesses();

  @override
  Widget build(BuildContext context) {
    QuerySearch currentSearch =
        Provider.of<SearchViewModel>(context).activeSearch;
    List<CategoryBtn> activeCategories =
        Provider.of<CategoryProvider>(context).activeCategoryBtns;

    double screenWidth = MediaQuery.of(context).size.width;
    bool displayedOnTabletOrSmaller = screenWidth < 600;
    if (!displayedOnTabletOrSmaller) {
      return Expanded(
          flex: 2,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextCaption(
                  text: 'New',
                ),
                MediumSpacer(),
                CustomTextNormal(
                  text: 'Check out some recently added businesses!',
                ),
                MediumSpacer(),
                BusinessesFoundInQuery(
                  currentSearch: currentSearch,
                  activeCategories: activeCategories,
                )
              ],
            ),
          ));
    } else {
      return Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextCaption(
            text: 'New',
          ),
          MediumSpacer(),
          CustomTextNormal(
            text: 'Check out some recently added businesses!',
          ),
          MediumSpacer(),
          BusinessesFoundInQuery(
              currentSearch: currentSearch, activeCategories: activeCategories)
        ],
      ));
    }
  }
}
