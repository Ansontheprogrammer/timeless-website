import 'package:flutter/material.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/widgets/home/recommended/category_option_btns/category_btn.dart';
import 'package:timeless_app/widgets/home/recommended/recommended_section.dart';

List<String> categoryOptionBtns = [
  'Food Services',
  'Arts, Entertainment',
  'Finance',
  'Healthcare',
  'Insurance',
  'Recreation'
];

class CategoryListButtons extends StatefulWidget {
  CategoryListButtons();

  @override
  _CategoryListButtonsState createState() => _CategoryListButtonsState();
}

class _CategoryListButtonsState extends State<CategoryListButtons> {
  int limit = 2;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Wrap(
            direction: Axis.horizontal,
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
  }
}