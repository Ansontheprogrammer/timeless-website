import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/utils/custom_section.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/utils/layout.dart';
import 'package:timeless_app/widgets/home/hero/search_bar.dart';

class SearchView extends StatelessWidget {
  SearchView();
  static const String route = '/search';

  @override
  Widget build(BuildContext context) {
    return Layout(
        pageContent: Column(
      children: [
        CustomSection(
            child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextNormal(text: 'Business Search'),
              SizedBox(
                height: 30,
              ),
              Wrap(
                spacing: 25.0,
                runSpacing: 25.0,
                crossAxisAlignment: WrapCrossAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: SearchBar()),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: SearchBar(
                        hint: 'Location',
                        icon: Icons.location_pin,
                      )),
                  ElevatedButton(
                      onPressed: () {},
                      child: CustomTextBtn(
                        color: Colors.white,
                        text: 'Find Businesses',
                      ))
                ],
              )
            ],
          ),
        )),
      ],
    ));
  }
}
