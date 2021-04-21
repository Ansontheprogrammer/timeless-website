import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeless_app/business_logic/models/business.dart';
import 'package:timeless_app/business_logic/models/category_btn.dart';
import 'package:timeless_app/business_logic/models/query.dart';
import 'package:timeless_app/business_logic/view_models/category_view_model.dart';
import 'package:timeless_app/business_logic/view_models/search_view_model.dart';
import 'package:timeless_app/services/firestore_service.dart';
import 'package:timeless_app/ui/shared/custom_text.dart';
import 'package:timeless_app/ui/widgets/home/recommended/nearby_businesses/nearby_card.dart';

class NearbyBusinessList extends StatelessWidget {
  final bool useHorizontal;
  const NearbyBusinessList({required this.useHorizontal});

  @override
  Widget build(BuildContext context) {
    QuerySearch activeSearch =
        Provider.of<SearchViewModel>(context).activeSearch;
    List<CategoryBtn> activeCategoryBtns =
        Provider.of<CategoryViewModel>(context).activeCategoryBtns;

    return StreamBuilder(
      stream: FirestoreService().queryBusinesses(query: activeSearch),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        List<Business> foundBusinesses = snapshot.data!.docs.map((snap) {
          return Business.fromJSON(snap.data()!);
        }).toList();
        List<Business> foundBusinessesWithFilter = [];
        if (activeCategoryBtns != null) {
          print({
            activeCategoryBtns[0].title,
            activeCategoryBtns.contains(CategoryBtn(title: 'tech')),
            'CHANGING ACTIVE CATEGORIES'
          });

          foundBusinessesWithFilter = foundBusinesses
              .where((element) =>
                  activeCategoryBtns.contains(CategoryBtn(title: element.type)))
              .toList();
          print({foundBusinessesWithFilter, 'foundBusinessesWithFilter'});
        }
        print({foundBusinessesWithFilter, 'foundBusinessesWithFilter'});

        return Wrap(runSpacing: 20, spacing: 20, children: [
          ...foundBusinessesWithFilter.map((business) {
            return NearbyBusinessCard(
                title: business.getBusinessName(),
                subtitle: business.type,
                description: business.description);
          }).toList()
        ]);
      },
    );
  }
}
