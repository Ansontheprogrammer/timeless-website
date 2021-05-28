import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/business_logic/models/business.dart';
import 'package:timeless_app/services/firestore_service.dart';
import 'package:timeless_app/ui/shared/utils/custom_text.dart';
import 'package:timeless_app/ui/shared/detail_screen_arguments.dart';
import 'package:timeless_app/ui/shared/adaptive/layout.dart';
import 'package:timeless_app/ui/widgets/detail/adaptive_detail_item.dart';

import '../shared/constants.dart';

/// Creates a view that contains all a [Business]'s details.
class DetailView extends StatelessWidget {
  DetailView({Key? key, required this.id}) : super(key: key);
  static const String route = '/detail';
  final String id;

  @override
  Widget build(BuildContext context) {
    return Layout(
        pageContent: Container(
      padding: const EdgeInsets.all(25.0),
      child: StreamBuilder<Business>(
          stream: FirestoreService().getBusiness(id: id),
          builder: (context, AsyncSnapshot<Business> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            /// Invalid business ID
            if (snapshot.data == null) {
              return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextNormal(
                      text: 'Sorry this business id is not found',
                    )
                  ]);
            }
            Business business = snapshot.data!;
            return AdaptiveDetailItem(
              business: business,
              imageTag: Constants.getBusinessHeroImage(business.id),
              imageUrl: business.imageURL ??
                  'https://images.unsplash.com/photo-1613664161831-35ca95a4b953?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80',
              name: Hero(
                  tag: Constants.getBusinessHeroTitle(business.id),
                  child: CustomTextLarge(
                    fontWeight: FontWeight.bold,
                    text: business.getBusinessName(),
                  )),
              description: Hero(
                tag: Constants.getBusinessHeroTitle(business.description),
                child: CustomTextNormal(
                  maxLines: 1000,
                  text: business.description,
                ),
              ),
            );
          }),
    ));
  }
}
