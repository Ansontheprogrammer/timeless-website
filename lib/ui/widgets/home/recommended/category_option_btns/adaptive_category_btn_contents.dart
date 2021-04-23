import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeless_app/business_logic/models/category_btn.dart';
import 'package:timeless_app/business_logic/providers/category_provider.dart';
import 'package:timeless_app/ui/shared/custom_text.dart';

class AdaptiveCategoryBtnContents extends StatelessWidget {
  const AdaptiveCategoryBtnContents(
      {Key? key, required this.active, required this.button})
      : super(key: key);

  final bool active;
  final CategoryBtn button;

  toggleButtonActiveState(CategoryProvider model) {
    if (active)
      model.removeActiveCategoryBtn(button);
    else
      model.addActiveCategoryBtn(button);
  }

  @override
  Widget build(BuildContext context) {
    CategoryProvider model =
        Provider.of<CategoryProvider>(context, listen: false);
    Color iconColor = !active ? Theme.of(context).primaryColor : Colors.white;

    RaisedButton categoryListTile = RaisedButton(
        onPressed: () => toggleButtonActiveState(model),
        splashColor: Theme.of(context).accentColor,
        color: this.active ? Theme.of(context).primaryColor : Colors.white,
        child: ListTile(
          dense: true,
          leading: Icon(Icons.category, color: iconColor),
          trailing: Icon(
            this.active ? Icons.remove : Icons.add,
            color: iconColor,
          ),
          contentPadding: EdgeInsets.all(2.0),
          title: CustomTextNormal(
            fontSize: 14.0,
            color: iconColor,
            text: this.button.title,
          ),
        ));

    Column categoryContentsColumn =
        Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      ClipRRect(
        borderRadius: kIsWeb
            ? BorderRadius.zero
            : BorderRadius.circular(MediaQuery.of(context).size.width / 2),
        child: RaisedButton(
          padding: EdgeInsets.all(20.0),
          onPressed: () => toggleButtonActiveState(model),
          splashColor: Theme.of(context).accentColor,
          color: this.active ? Theme.of(context).primaryColor : Colors.white,
          child: Column(
            children: [
              Icon(Icons.category, color: iconColor),
              Icon(
                this.active ? Icons.remove : Icons.add,
                color: iconColor,
              ),
            ],
          ),
        ),
      ),
      CustomTextNormal(
        fontWeight: FontWeight.bold,
        color: !active ? Colors.grey.shade800 : Theme.of(context).primaryColor,
        text: this.button.title,
      ),
    ]);

    return Container(child: kIsWeb ? categoryListTile : categoryContentsColumn);
  }
}
