import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:timeless_app/ui/shared/custom_text.dart';
import 'package:timeless_app/ui/widgets/home/recommended/category_option_btns/category_btn.dart';

import '../../landing_page_content.dart';

List<String> categoryOptionBtns = [
  'Food Services',
  'Entertainment',
  'Finance',
  'Healthcare',
  'Insurance',
  'Recreation'
];

// TODO: Combine these two widgets and make them adaptive
class CategoryListButtons extends StatefulWidget {
  CategoryListButtons();

  @override
  _CategoryListButtonsState createState() => _CategoryListButtonsState();
}

int limit = 2;

class _CategoryListButtonsState extends State<CategoryListButtons> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool onDesktop = screenWidth > 600;
    if (limit == 2 && onDesktop) limit = 3;
    Wrap adaptiveListWrap = Wrap(
        direction: onDesktop || !kIsWeb ? Axis.horizontal : Axis.vertical,
        runSpacing: 15.0,
        spacing: 15.0,
        children: [
          ...categoryOptionBtns
              .sublist(0, limit)
              .map((option) => CategoryBtn(
                    title: option,
                  ))
              .toList(),
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)),
                    primary: limit != categoryOptionBtns.length
                        ? Theme.of(context).primaryColor
                        : Colors.grey),
                onPressed: () {
                  setState(() {
                    limit += 2;
                    if (limit >= categoryOptionBtns.length) {
                      limit = categoryOptionBtns.length;
                    }
                  });
                },
                child: CustomTextBtn(
                    text: limit != categoryOptionBtns.length
                        ? 'Show More Categories'
                        : 'Showing all Categories',
                    color: Colors.white)),
          )
        ]);
    Widget adaptiveList = Container(
        height: MediaQuery.of(context).size.height * 0.2,
        child: ListView(scrollDirection: Axis.horizontal, children: [
          ...categoryOptionBtns
              .sublist(0, limit)
              .map((option) => Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: CategoryBtn(
                      title: option,
                    ),
                  ))
              .toList(),
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)),
                    primary: limit != categoryOptionBtns.length
                        ? Theme.of(context).primaryColor
                        : Colors.grey),
                onPressed: () {
                  setState(() {
                    limit += 2;
                    if (limit >= categoryOptionBtns.length) {
                      limit = categoryOptionBtns.length;
                    }
                  });
                },
                child: CustomTextBtn(
                    text: limit != categoryOptionBtns.length
                        ? 'Show More Categories'
                        : 'Showing all Categories',
                    color: Colors.white)),
          )
        ]));
    return CenterWidgetOnWeb(child: kIsWeb ? adaptiveListWrap : adaptiveList);
  }
}
