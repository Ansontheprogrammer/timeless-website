import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:timeless_app/utils/custom_text.dart';

class NewBusinessListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  NewBusinessListItem(
      {this.description = '', required this.subtitle, required this.title});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableScrollActionPane(),
      child: ListTile(
        leading: AspectRatio(
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
        tileColor: Colors.white,
        title: CustomTextLarge(text: this.title),
        subtitle: CustomTextCaption(
          text: this.subtitle,
          fontSize: 12.0,
        ),
        trailing: Icon(Icons.business),
      ),
    );
  }
}
