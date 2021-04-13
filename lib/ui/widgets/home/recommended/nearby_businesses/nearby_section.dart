import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeless_app/ui/shared/container_spacer.dart';
import 'package:timeless_app/ui/shared/custom_text.dart';
import 'package:timeless_app/ui/widgets/home/recommended/nearby_businesses/nearby_list.dart';

class NearbyBusinessSection extends StatelessWidget {
  const NearbyBusinessSection();

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
                NearbyBusinessList(useHorizontal: displayedOnTabletOrSmaller)),
      ]),
    );
  }
}
