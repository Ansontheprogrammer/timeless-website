import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeless_app/business_logic/models/category_btn.dart';
import 'package:timeless_app/business_logic/models/query.dart';
import 'package:timeless_app/business_logic/view_models/category_view_model.dart';
import 'package:timeless_app/business_logic/view_models/search_view_model.dart';
import 'package:timeless_app/ui/shared/container_spacer.dart';
import 'package:timeless_app/ui/shared/custom_text.dart';
import 'package:timeless_app/ui/widgets/search/businesses_found_in_query.dart';

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
                ContainerSpacer(),
                CustomTextNormal(
                  text:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                ),
                ContainerSpacer(),
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
          ContainerSpacer(),
          CustomTextNormal(
            text:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
          ),
          ContainerSpacer(),
          BusinessesFoundInQuery(
              currentSearch: currentSearch, activeCategories: activeCategories)
        ],
      ));
    }
  }
}
