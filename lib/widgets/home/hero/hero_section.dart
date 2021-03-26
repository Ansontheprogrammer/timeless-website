import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeless_app/utils/container_spacer.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/widgets/home/hero/hero_container.dart';
import 'package:timeless_app/widgets/home/hero/search_bar.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HeroContainer(
      child: Container(
        margin: EdgeInsets.only(bottom: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextHeadline(
                    color: Colors.white,
                    fontSize: 72.0,
                    text: 'Let',
                  ),
                  const CustomTextHeadline(
                    color: Colors.white,
                    text: 'me help you find',
                  ),
                  const CustomTextHeadline(
                    color: Colors.white,
                    text: 'a good local business',
                  ),
                ],
              ),
            ),
            ContainerSpacer(),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width * 0.7,
              child: const SearchBar(),
            )
          ],
        ),
      ),
    );
  }
}
