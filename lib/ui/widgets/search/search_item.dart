import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeless_app/business_logic/models/business.dart';
import 'package:timeless_app/ui/enums/business_search.dart';
import 'package:timeless_app/ui/shared/custom_text.dart';

class SearchItem extends StatelessWidget {
  final Business business;
  final BusinessSearch searchType;
  const SearchItem({
    Key? key,
    required this.business,
    required this.searchType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.5),
        ),
        padding: EdgeInsets.all(20.0),
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchType == BusinessSearch.Name
                ? CustomTextNormal(text: business.getBusinessName())
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_pin,
                        size: 10.0,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CustomTextCaption(fontSize: 10.0, text: business.zipcode),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
