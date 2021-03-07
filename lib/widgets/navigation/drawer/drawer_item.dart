import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/utils/custom_text.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final void Function() handler;
  const DrawerItem({required this.title, required this.handler});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: CustomTextNormal(text: 'Home'),
      onTap: handler,
    );
  }
}
