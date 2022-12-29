import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/ui/shared/utils/custom_text.dart';

class MobileNavItem extends StatelessWidget {
  final String title;
  final String routeName;
  const MobileNavItem(this.title, this.routeName);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, routeName);
            },
            child: CustomTextNormal(
              color: Colors.white,
              text: title,
            ),
          ),
        ],
      ),
    );
  }
}
