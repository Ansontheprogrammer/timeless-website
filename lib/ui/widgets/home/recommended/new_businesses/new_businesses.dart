import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeless_app/business_logic/models/business.dart';
import 'package:timeless_app/ui/shared/custom_text.dart';
import 'package:timeless_app/ui/widgets/home/recommended/new_businesses/new_business_list_item.dart';

class NewBusinessList extends StatelessWidget {
  const NewBusinessList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection(Business.dbCollectionName)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.data!.docs.isEmpty) {
          Container(
            child: CustomTextNormal(
                text: "Sorry we don't have any businesses in our system yet"),
          );
        }

        // Convert businesses list map from DB to list of Business models
        List<Business> businesses = snapshot.data!.docs
            .map((businessJSON) => Business.fromJSON(businessJSON.data()!))
            .toList();

        return Wrap(
            runSpacing: 20,
            spacing: 20,
            children: businesses.map((business) {
              return NewBusinessListItem(
                  title: business.getBusinessName(),
                  subtitle: business.type,
                  description: business.description);
            }).toList());
      },
    );
  }
}
