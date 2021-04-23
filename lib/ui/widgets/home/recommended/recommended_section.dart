import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeless_app/business_logic/enums/business_search.dart';
import 'package:timeless_app/business_logic/models/category_btn.dart';
import 'package:timeless_app/business_logic/models/query.dart';
import 'package:timeless_app/business_logic/providers/category_provider.dart';
import 'package:timeless_app/business_logic/view_models/search_view_model.dart';
import 'package:timeless_app/ui/widgets/home/recommended/nearby_businesses/nearby_section.dart';
import 'package:timeless_app/ui/widgets/home/recommended/new_businesses/new_business_section.dart';
import 'package:timeless_app/ui/widgets/search/businesses_found_in_query.dart';

// TODO: Create a landing page view model and sync the categories and search for filtering
class RecommendedSection extends StatelessWidget {
  final bool displayHorizontal;
  const RecommendedSection({this.displayHorizontal = false});

  @override
  Widget build(BuildContext context) {
    if (!displayHorizontal) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 4, child: NearbyBusinessSection()),
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
