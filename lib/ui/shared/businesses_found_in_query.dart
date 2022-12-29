import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:timeless_app/business_logic/enums/display_type.dart';
import 'package:timeless_app/business_logic/models/business.dart';
import 'package:timeless_app/business_logic/models/category_btn.dart';
import 'package:timeless_app/business_logic/models/query.dart';
import 'package:timeless_app/services/firestore_service.dart';
import 'package:timeless_app/ui/shared/utils/custom_text.dart';
import 'business_list_item.dart';

class BusinessesFoundInQuery extends StatelessWidget {
  const BusinessesFoundInQuery({
    Key? key,
    this.activeCategories,
    this.displayType = BusinessListDisplayType.ListTile,
    required this.currentSearch,
  }) : super(key: key);

  final QuerySearch currentSearch;
  final BusinessListDisplayType displayType;
  final List<CategoryBtn>? activeCategories;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreService().queryBusinesses(query: currentSearch),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.data == null) {
          return CustomTextNormal(
              text:
                  'Sorry we were not able to find nearby businesses. Are you sure you are connected to the internet?');
        }
        List<Business> foundBusinesses = snapshot.data!.docs.map((snap) {
          return Business.fromJSON(snap.data() as Map<String, dynamic>);
        }).toList();

        List<Business> foundBusinessesWithFilter = foundBusinesses;
        if (activeCategories != null && activeCategories!.isNotEmpty) {
          foundBusinessesWithFilter = foundBusinesses.where((business) {
            return this
                .activeCategories!
                .where((category) => category.title == business.type)
                .isNotEmpty;
          }).toList();
        }

        List<Business> businessListToUse = activeCategories == null
            ? foundBusinesses
            : foundBusinessesWithFilter;

        return Wrap(
            alignment: WrapAlignment.spaceBetween,
            runSpacing: 20,
            spacing: 20,
            children: businessListToUse
                .map((business) => BusinessItem(
                      business: business,
                      displayType: displayType,
                    ))
                .toList());
      },
    );
  }
}
