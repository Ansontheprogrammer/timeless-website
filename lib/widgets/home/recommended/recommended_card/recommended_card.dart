import 'package:flutter/material.dart';
import 'package:timeless_app/utils/container_spacer.dart';
import 'package:timeless_app/utils/custom_text.dart';

class RecommendedCard extends StatelessWidget {
  const RecommendedCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.transparent,
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
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1613664161831-35ca95a4b953?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80',
                    height: 150.0,
                    // width: 100.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextBtn(
              text: 'Heart Shaker',
              fontWeight: FontWeight.w100,
            ),
            SizedBox(
              height: 5,
            ),
            CustomTextNormal(
              text: 'Twice',
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 5,
            ),
            CustomTextNormal(
                text:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),

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
      ),
    );
  }
}
