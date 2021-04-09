import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/utils/custom_section.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/utils/layout.dart';
import 'package:timeless_app/widgets/home/hero/search_bar.dart';
import 'package:timeless_app/widgets/search/search_item.dart';

class SearchView extends StatelessWidget {
  SearchView();
  static const String route = '/search';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool displayedOnTabletOrSmaller = screenWidth < 800;
    return Layout(
        pageContent: Column(
      children: [
        CustomSection(
            child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextLarge(text: 'Business Search'),
              SizedBox(
                height: 30,
              ),
              !displayedOnTabletOrSmaller
                  ? Wrap(
                      spacing: 25.0,
                      runSpacing: 25.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.81,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.5),
                            border: Border.all(
                              color: Colors.black12,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: SearchBar(
                                    noBorder: true,
                                  )),
                              Container(
                                  width: 1, height: 20, color: Colors.black26),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: SearchBar(
                                    hint: 'Location',
                                    icon: Icons.location_pin,
                                    noBorder: true,
                                  )),
                            ],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            child: CustomTextBtn(
                              color: Colors.white,
                              text: 'Find Businesses',
                            )),
                      ],
                    )
                  : Center(
                      child: Column(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: SearchBar(
                                noBorder: true,
                              )),
                          ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 100),
                              child:
                                  Divider(thickness: 1, color: Colors.black26)),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: SearchBar(
                                hint: 'Location',
                                icon: Icons.location_pin,
                                noBorder: true,
                              )),
                          ElevatedButton(
                              onPressed: () {},
                              child: CustomTextBtn(
                                color: Colors.white,
                                text: 'Find Businesses',
                              )),
                        ],
                      ),
                    ),
            ],
          ),
        )),
        CustomSection(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextLarge(text: 'Recent Searches'),
            SizedBox(
              height: 20,
            ),
            Wrap(
              spacing: 20.0,
              children: [
                SearchItem(),
                SearchItem(),
                SearchItem(),
              ],
            )
          ],
        ))
      ],
    ));
  }
}