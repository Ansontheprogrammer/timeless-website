import 'package:flutter/material.dart';
import 'package:timeless_app/widgets/home/recommended/recommended_section.dart';
import 'package:timeless_app/widgets/home/recommended/recommended_btns/recommended_btn.dart';

class RecommendedListButtons extends StatelessWidget {
  const RecommendedListButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.center,
      direction: Axis.horizontal,
      runSpacing: 15.0,
      spacing: 15.0,
      children: recommendedBtnsOptions.map((option) {
        return RecommendedBtn(
          title: option,
        );
      }).toList(),
    );
  }
}
