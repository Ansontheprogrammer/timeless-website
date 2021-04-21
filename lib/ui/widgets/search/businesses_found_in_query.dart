import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:timeless_app/business_logic/models/business.dart';
import 'package:timeless_app/business_logic/models/category_btn.dart';
import 'package:timeless_app/business_logic/models/query.dart';
import 'package:timeless_app/business_logic/enums/business_search.dart';

import 'package:timeless_app/services/firestore_service.dart';
import 'package:timeless_app/ui/widgets/home/recommended/new_businesses/new_business_list_item.dart';

class BusinessesFoundInQuery extends StatelessWidget {
  const BusinessesFoundInQuery({
    Key? key,
    this.activeCategorys,
    required this.currentSearch,
  }) : super(key: key);

  final QuerySearch currentSearch;
  final List<CategoryBtn>? activeCategorys;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreService().queryBusinesses(query: currentSearch),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        List<Business> foundBusinesses = snapshot.data!.docs.map((snap) {
          return Business.fromJSON(snap.data()!);
        }).toList();
        List<Business> foundBusinessesWithFilter = [];
        if (activeCategorys != null) {
          print({
            activeCategorys![0].title,
            activeCategorys!.contains(CategoryBtn(title: 'tech')),
            'CHANGING ACTIVE CATEGORIES'
          });

          foundBusinessesWithFilter = foundBusinesses
              .where((element) => this
                  .activeCategorys!
                  .contains(CategoryBtn(title: element.type)))
              .toList();
          print({foundBusinessesWithFilter, 'foundBusinessesWithFilter'});
        }
        print({foundBusinessesWithFilter, 'foundBusinessesWithFilter'});

        List<Business> businessListToUse = activeCategorys == null
            ? foundBusinesses
            : foundBusinessesWithFilter;
        return Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 20,
            spacing: 20,
            children: businessListToUse
                .map((business) => NewBusinessListItem(
                      title: business.getBusinessName(),
                      subtitle: business.type,
                      description: business.description,
                    ))
                .toList());
      },
    );
  }
}
