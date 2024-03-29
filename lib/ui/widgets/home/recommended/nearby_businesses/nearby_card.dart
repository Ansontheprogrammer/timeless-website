import 'package:flutter/material.dart';
import 'package:timeless_app/ui/shared/constants.dart';
import 'package:timeless_app/ui/shared/utils/custom_text.dart';

import '../../../../shared/utils/medium_spacer.dart';
import '../../../../shared/utils/small_spacer.dart';

/// Creates a [Card] display for the businesses
class NearbyBusinessCard extends StatelessWidget {
  final String title;
  final String id;
  final String subtitle;
  final String description;
  final String imageURL;
  NearbyBusinessCard(
      {required this.id,
      required this.imageURL,
      this.description = '',
      required this.subtitle,
      required this.title});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool onDesktop = screenWidth > 600;
    return Container(
      width: onDesktop
          ? MediaQuery.of(context).size.width / 4
          : MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
        color: Colors.white,
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 4 / 3,
              child: FittedBox(
                fit: BoxFit.fill,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(2.5),
                      topRight: Radius.circular(2.5)),
                  child: Hero(
                    tag: Constants.getBusinessHeroImage(id),
                    child: Image.network(
                      imageURL,
                      height: 150.0,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: Constants.getBusinessHeroTitle(id),
                    child: CustomTextNormal(
                      text: title,
                      fontWeight: FontWeight.bold,
                      maxLines: 1,
                    ),
                  ),
                  CustomTextBtn(
                    color: Colors.black26,
                    text: subtitle,
                    fontWeight: FontWeight.w100,
                  ),
                  const SmallSpacer(),
                  Hero(
                      tag: Constants.getBusinessHeroDescription(id),
                      child: CustomTextNormal(text: description)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
