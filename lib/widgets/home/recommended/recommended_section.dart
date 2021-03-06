import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeless_app/utils/container_spacer.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/widgets/home/recommended/recommended_btns/recommended_btn.dart';
import 'package:timeless_app/widgets/home/recommended/recommended_card/recommended_card.dart';
import 'package:timeless_app/widgets/home/recommended/recommended_card/recommended_list_card.dart';
import 'package:timeless_app/widgets/home/recommended/recommended_btns/recommended_list_buttons.dart';

List<String> recommendedBtnsOptions = [
  ' Button 2 ',
  ' Button 3 ',
  ' Button 4 ',
  ' Button 5 ',
  ' Button 6 ',
  ' Button 7 '
];

class LeftColumnRecommended extends StatelessWidget {
  const LeftColumnRecommended();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const CustomTextCaption(
          text: 'Recommended to you',
        ),
        const ContainerSpacer(),
        RecommendedListButtons(),
        SizedBox(height: 20),
        RecommendedListCard()
      ]),
    );
  }
}
