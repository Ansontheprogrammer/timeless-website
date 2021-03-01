import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeless_app/utils/container_spacer.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/widgets/home/recommended/left_column_btn_data.dart';

class LeftColumnRecommended extends StatelessWidget {
  const LeftColumnRecommended({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const CustomTextCaption(
        text: 'Recommeded to you',
      ),
      const ContainerSpacer(),
      Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        alignment: WrapAlignment.start,
        direction: Axis.horizontal,
        children: recommendedBtns,
      ),
    ]);
  }
}
