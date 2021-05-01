import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeless_app/business_logic/providers/category_provider.dart';
import 'package:timeless_app/ui/shared/adaptive/adaptive_center.dart';
import 'package:timeless_app/ui/shared/utils/custom_text.dart';
import 'package:timeless_app/ui/shared/data/category_btns.data.dart';
import 'package:timeless_app/ui/widgets/home/recommended/category_option_btns/category_btn.dart';

// TODO: Combine these two widgets and make them adaptive
/// Creates a list of category buttons that will either be given a [Wrap] or [ListView]
///
/// For mobile we use a [ListView] and for desktop [Wrap]
class CategoryListButtons extends StatefulWidget {
  CategoryListButtons();

  @override
  _CategoryListButtonsState createState() => _CategoryListButtonsState();
}

class _CategoryListButtonsState extends State<CategoryListButtons> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool onDesktop = screenWidth > 600;

    CategoryProvider model = Provider.of<CategoryProvider>(context);
    int limit = model.limit;

    if (limit == 2 && onDesktop) limit = 3;
    Wrap adaptiveListWrap = Wrap(
        direction: onDesktop || !kIsWeb ? Axis.horizontal : Axis.vertical,
        runSpacing: 15.0,
        spacing: 15.0,
        children: [
          ...categoryOptionBtns
              .sublist(0, limit)
              .map((option) => CategoryBtnUI(
                    button: option,
                  ))
              .toList(),
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: limit != categoryOptionBtns.length
                        ? Theme.of(context).primaryColor
                        : Colors.grey),
                onPressed: model.increaseLimit,
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
                    child: CategoryBtnUI(
                      button: option,
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
                onPressed: model.increaseLimit,
                child: CustomTextBtn(
                    text: limit != categoryOptionBtns.length
                        ? 'Show More Categories'
                        : 'Showing all Categories',
                    color: Colors.white)),
          )
        ]));
    return AdaptiveCenter(child: kIsWeb ? adaptiveListWrap : adaptiveList);
  }
}
