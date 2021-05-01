import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeless_app/ui/shared/utils/custom_text.dart';

class NewBusinessListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String imageURL;
  NewBusinessListItem(
      {required this.imageURL,
      this.description = '',
      required this.subtitle,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AspectRatio(
        aspectRatio: 4 / 3,
        child: FittedBox(
          fit: BoxFit.fill,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageURL,
              height: 150.0,
              // width: 100.0,
            ),
          ),
        ),
      ),
      tileColor: Colors.white,
      title: CustomTextLarge(text: this.title),
      subtitle: CustomTextCaption(
        text: this.subtitle,
        fontSize: 12.0,
      ),
      trailing: Icon(Icons.business),
    );
  }
}
