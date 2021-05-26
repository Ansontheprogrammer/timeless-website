import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/business_logic/models/business.dart';
import 'package:timeless_app/ui/shared/utils/custom_text.dart';
import 'package:timeless_app/ui/shared/detail_screen_arguments.dart';
import 'package:timeless_app/ui/shared/utils/layout.dart';
import 'package:timeless_app/ui/widgets/detail/adaptive_detail_item.dart';

import '../shared/constants.dart';

/// Creates a view that contains all a [Business]'s details.
class DetailView extends StatelessWidget {
  DetailView({Key? key}) : super(key: key);
  static const String route = '/detail';

  @override
  Widget build(BuildContext context) {
    final DetailScreenArguments args =
        ModalRoute.of(context)!.settings.arguments as DetailScreenArguments;
    Business business = args.business;
    return Layout(
        pageContent: Container(
      padding: const EdgeInsets.all(25.0),
      child: AdaptiveDetailItem(
        business: business,
        imageTag: Constants.getBusinessHeroImage(business.id),
        imageUrl: business.imageURL ??
            'https://images.unsplash.com/photo-1613664161831-35ca95a4b953?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80',
        name: Hero(
            tag: Constants.getBusinessHeroTitle(business.id),
            child: CustomTextNormal(
              fontWeight: FontWeight.bold,
              text: business.getBusinessName(),
            )),
        description: Hero(
          tag: Constants.getBusinessHeroTitle(business.description),
          child: Container(
            child: CustomTextNormal(
              text: business.description,
            ),
          ),
        ),
      ),
    ));
  }
}
