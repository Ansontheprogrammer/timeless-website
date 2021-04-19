import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeless_app/business_logic/models/category_btn.dart';
import 'package:timeless_app/business_logic/view_models/category_view_model.dart';
import 'package:timeless_app/ui/widgets/home/recommended/category_option_btns/adaptive_category_btn_contents.dart';

class CategoryBtnUI extends StatelessWidget {
  final CategoryBtn button;
  CategoryBtnUI({required this.button});

  @override
  Widget build(BuildContext context) {
    CategoryViewModel model = Provider.of<CategoryViewModel>(context);
    bool _active = model.activeCategoryBtns.contains(button);
    double screenWidth = MediaQuery.of(context).size.width;
    bool onDesktop = screenWidth > 600;

    return Container(
      width: onDesktop
          ? MediaQuery.of(context).size.width / 5
          : kIsWeb
              ? MediaQuery.of(context).size.width * 0.5
              : MediaQuery.of(context).size.width * 0.4,
      child: AdaptiveCategoryBtnContents(
        button: this.button,
        active: _active,
      ),
    );
  }
}
