import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeless_app/ui/widgets/home/recommended/new_businesses/new_business_section.dart';
import 'package:timeless_app/ui/widgets/home/recommended/nearby_businesses/nearby_section.dart';

// TODO: Create a landing page view model and sync the categories and search for filtering
class RecommendedSection extends StatelessWidget {
  final bool displayHorizontal;
  // final String currentSearch;
  const RecommendedSection(
      {
      // required this.currentSearch,
      this.displayHorizontal = false});

  @override
  Widget build(BuildContext context) {
    if (!displayHorizontal) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 4, child: NearbyBusinessSection()
              // child: BusinessesFoundInQuery(
              //     currentSearch: QuerySearch(
              //         fieldName: BusinessSearchTypes.Name,
              //         search: this.currentSearch))
              ),
          SizedBox(
            width: 50,
          ),
          RecommendedNewBusinesses(),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NearbyBusinessSection(),
          SizedBox(
            height: 50,
          ),
          RecommendedNewBusinesses()
        ],
      );
    }
  }
}
