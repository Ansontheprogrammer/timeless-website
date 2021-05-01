import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/business_logic/models/business.dart';
import 'package:timeless_app/ui/shared/utils/custom_text.dart';
import 'package:timeless_app/ui/shared/detail_screen_arguments.dart';
import 'package:timeless_app/ui/shared/utils/layout.dart';
import 'package:timeless_app/ui/views/contact.dart';

import '../constants.dart';

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
        pageContent: Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: Constants.getBusinessHeroImage(business.id),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1613664161831-35ca95a4b953?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80'),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                        tag: Constants.getBusinessHeroTitle(business.id),
                        child: CustomTextNormal(
                          fontWeight: FontWeight.bold,
                          text: business.getBusinessName(),
                        )),
                    Hero(
                      tag: Constants.getBusinessHeroTitle(business.description),
                      child: Container(
                        child: CustomTextNormal(
                          text: business.description,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
