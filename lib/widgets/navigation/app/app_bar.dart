import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeless_app/utils/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
        flexibleSpace: const FlexibleSpaceBar(
      title: CustomTextNormal(text: 'Timeless on an App', color: Colors.white),
    ));
  }
}
