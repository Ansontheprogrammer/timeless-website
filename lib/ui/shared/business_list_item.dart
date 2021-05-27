import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeless_app/business_logic/enums/display_type.dart';
import 'package:timeless_app/business_logic/models/business.dart';
import 'package:timeless_app/ui/shared/detail_screen_arguments.dart';
import 'package:timeless_app/ui/views/detail.dart';
import 'package:timeless_app/ui/widgets/home/recommended/nearby_businesses/nearby_card.dart';
import 'package:timeless_app/ui/widgets/home/recommended/new_businesses/new_business_list_item.dart';

/// Used to wrap the business list items with a button to navigate to the detail screen.
class BusinessItem extends StatelessWidget {
  const BusinessItem(
      {Key? key, required this.displayType, required this.business})
      : super(key: key);
  final BusinessListDisplayType displayType;
  final Business business;

  @override
  Widget build(BuildContext context) {
    Widget listItemWidget;
    if (displayType == BusinessListDisplayType.ListTile) {
      listItemWidget = NewBusinessListItem(
        imageURL: business.imageURL ??
            'https://images.unsplash.com/photo-1613664161831-35ca95a4b953?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80',
        title: business.getBusinessName(),
        subtitle: business.type,
        description: business.description,
      );
    } else {
      listItemWidget = NearbyBusinessCard(
          id: business.id,
          imageURL: business.imageURL ??
              'https://images.unsplash.com/photo-1613664161831-35ca95a4b953?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80',
          description: business.description,
          subtitle: business.type,
          title: business.getBusinessName());
    }
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(0),
            shadowColor: Colors.transparent,
            primary: Colors.transparent),
        onPressed: () {
          Navigator.pushNamed(context, '${DetailView.route}?id=${business.id}',
              arguments: DetailScreenArguments(business: business));
        },
        child: listItemWidget);
  }
}
