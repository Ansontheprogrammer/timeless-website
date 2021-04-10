import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeless_app/domain/firestore.dart';
import 'package:timeless_app/models/business.dart';
import 'package:timeless_app/models/query.dart';
import 'package:timeless_app/providers/search_provider.dart';
import 'package:timeless_app/utils/custom_section.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/widgets/search/search_item.dart';

class RecentSearches extends StatelessWidget {
  const RecentSearches({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuerySearch currentSearch = Provider.of<SearchProvider>(context).search;
    return CustomSection(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextLarge(text: 'Recent Searches'),
        SizedBox(
          height: 20,
        ),
        StreamBuilder(
          stream: FirestoreService().businessQuery(
              query:
                  QuerySearch(fieldName: 'name', search: currentSearch.search)),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            List<Business> foundBusinesses = snapshot.data!.docs
                .map((snap) => Business.fromJSON(snap.data()!))
                .toList();
            print(foundBusinesses);
            return Row(
                children: foundBusinesses
                    .map((business) => SearchItem(business: business))
                    .toList());
          },
        )
      ],
    ));
  }
}
