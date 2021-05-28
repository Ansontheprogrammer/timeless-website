import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:timeless_app/business_logic/models/business.dart';
import 'package:timeless_app/ui/shared/utils/custom_text.dart';

class AdaptiveDetailItem extends StatelessWidget {
  const AdaptiveDetailItem(
      {Key? key,
      required this.imageTag,
      required this.imageUrl,
      required this.name,
      required this.description,
      required this.business})
      : super(key: key);

  final String imageTag;
  final String imageUrl;
  final Hero name;
  final Hero description;
  final Business business;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Container(
        color: Colors.black12,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: imageTag,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(imageUrl))),
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.6,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white10,
                constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height * 0.6),
                child: Stack(
                  children: [
                    Container(
                        padding: EdgeInsets.all(20),
                        constraints: BoxConstraints(
                            minHeight:
                                MediaQuery.of(context).size.height * 0.6),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.05),
                                  child: name),
                              Container(
                                  margin: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.1),
                                  child: description),
                            ])),
                    Positioned(
                      bottom: 10,
                      left: 20,
                      child: Row(
                        children: [
                          Icon(Icons.location_pin),
                          SizedBox(
                            width: 10,
                          ),
                          CustomTextCaption(text: business.zipcode)
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: 10,
                        right: 20,
                        child: CustomTextCaption(
                          text: business.website,
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: imageTag,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(imageUrl))),
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 1,
              ),
            ),
            SizedBox(height: 25),
            name,
            SizedBox(height: 25),
            description,
            SizedBox(height: 25),
          ],
        ),
      );
    }
  }
}
