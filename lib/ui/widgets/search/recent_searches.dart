import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeless_app/business_logic/models/business.dart';
import 'package:timeless_app/business_logic/models/query.dart';
import 'package:timeless_app/business_logic/view_models/search_view_model.dart';
import 'package:timeless_app/services/firestore_service.dart';
import 'package:timeless_app/ui/enums/business_search.dart';
import 'package:timeless_app/ui/shared/custom_section.dart';
import 'package:timeless_app/ui/widgets/search/search_item.dart';
import 'package:timeless_app/ui/shared/custom_text.dart';

class RecentSearches extends StatelessWidget {
  const RecentSearches({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuerySearch currentSearch = Provider.of<SearchViewModel>(context).search;
    return CustomSection(
        color: Colors.black12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextLarge(text: 'Recent Searches'),
            SizedBox(
              height: 20,
            ),
            StreamBuilder(
              stream: FirestoreService().queryBusinesses(
                  query: QuerySearch(
                      fieldName: 'name', search: currentSearch.search)),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                List<Business> foundBusinesses = snapshot.data!.docs
                    .map((snap) => Business.fromJSON(snap.data()!))
                    .toList();
                return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: foundBusinesses
                        .map((business) => SearchItem(
                            searchType: BusinessSearch.Name,
                            business: business))
                        .toList());
              },
            )
          ],
        ));
  }
}
