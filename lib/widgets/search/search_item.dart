import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeless_app/utils/custom_text.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: EdgeInsets.all(20.0),
        width: 125,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextNormal(text: 'Salons'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_pin,
                  size: 10.0,
                ),
                SizedBox(
                  width: 10,
                ),
                CustomTextCaption(fontSize: 10.0, text: 'USA'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
