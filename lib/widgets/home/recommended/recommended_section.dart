import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeless_app/utils/container_spacer.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/utils/small_spacer.dart';
import 'package:timeless_app/widgets/home/recommended/recommended_card/recommended_card.dart';
import 'package:timeless_app/widgets/home/recommended/recommended_card/recommended_list_card.dart';

class LeftColumnRecommended extends StatelessWidget {
  const LeftColumnRecommended();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool displayedOnTabletOrSmaller = screenWidth < 600;

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const CustomTextCaption(
          text: 'Recommended to you',
        ),
        const ContainerSpacer(),
        SizedBox(height: 20),
        Container(
            child:
                RecommendedListCard(useHorizontal: displayedOnTabletOrSmaller)),
      ]),
    );
  }
}
