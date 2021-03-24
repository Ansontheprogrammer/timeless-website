import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeless_app/models/business.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/widgets/home/recommended/recommended_card/recommended_card.dart';

class RecommendedListCard extends StatelessWidget {
  final bool useHorizontal;
  const RecommendedListCard({required this.useHorizontal});

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

        // Convert businesses list map from DB to list of Business models
        List<Business> businesses = snapshot.data!.docs
            .map((businessJSON) => Business.fromJSON(businessJSON.data()!))
            .toList();

        if (!snapshot.hasData) {
          Container(
            child: CustomTextNormal(
                text: "Sorry we don't have any businesses in our system yet"),
          );
        }

        return Wrap(
            runSpacing: 20,
            spacing: 20,
            children: businesses.map((business) {
              return RecommendedCard(
                  title: business.name,
                  subtitle: business.type,
                  description: business.description);
            }).toList());
      },
    );
  }
}
