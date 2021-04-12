import 'package:flutter/material.dart';
import 'package:timeless_app/utils/custom_text.dart';

class NearbyBusinessCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  NearbyBusinessCard(
      {this.description = '', required this.subtitle, required this.title});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool onDesktop = screenWidth > 600;
    return Container(
      width: onDesktop
          ? MediaQuery.of(context).size.width / 4
          : MediaQuery.of(context).size.width * 0.4,
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
                  child: Image.network(
                    'https://images.unsplash.com/photo-1613664161831-35ca95a4b953?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80',
                    height: 150.0,
                    // width: 100.0,
                  ),
                ),
              ),
            ),
            Container(
              constraints: BoxConstraints(minHeight: 175),
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextBtn(
                    text: subtitle,
                    fontWeight: FontWeight.w100,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextNormal(
                    text: title,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextNormal(text: description),

                  // ButtonBar(
                  //   alignment: MainAxisAlignment.spaceBetween,
                  //   children: <Widget>[
                  //     FlatButton(
                  //       padding: EdgeInsets.all(0),
                  //       color: Theme.of(context).accentColor,
                  //       child:
                  //           const Text('Edit', style: TextStyle(color: Colors.white)),
                  //       onPressed: () {},
                  //     ),
                  //     FlatButton(
                  //       color: Theme.of(context).primaryColor,
                  //       child: const Text('Delete',
                  //           style: TextStyle(color: Colors.white)),
                  //       onPressed: () {},
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
