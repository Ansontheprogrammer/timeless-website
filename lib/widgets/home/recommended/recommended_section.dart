import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeless_app/widgets/home/recommended/new_businesses/new_business_section.dart';
import 'package:timeless_app/widgets/home/recommended/nearby_businesses/nearby_section.dart';

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
