import 'package:flutter/material.dart';
import 'package:timeless_app/utils/custom_text.dart';

class CategoryBtn extends StatefulWidget {
  final String title;
  CategoryBtn({required this.title});

  @override
  _CategoryBtnState createState() => _CategoryBtnState();
}

class _CategoryBtnState extends State<CategoryBtn> {
  bool active = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool onDesktop = screenWidth > 600;
    Color textAndIconColor =
        !active ? Theme.of(context).primaryColor : Colors.white;
    return Container(
      width: onDesktop
          ? MediaQuery.of(context).size.width / 5
          : MediaQuery.of(context).size.width * 0.4,
      child: RaisedButton(
          onPressed: () {
            setState(() {
              active = !this.active;
            });
          },
          splashColor: Theme.of(context).accentColor,
          color: active ? Theme.of(context).primaryColor : Colors.white,
          child: ListTile(
            dense: true,
            leading: Icon(Icons.category, color: textAndIconColor),
            trailing: Icon(
              active ? Icons.remove : Icons.add,
              color: textAndIconColor,
            ),
            contentPadding: EdgeInsets.all(2.0),
            title: CustomTextNormal(
              fontSize: 14.0,
              color: textAndIconColor,
              text: widget.title,
            ),
            // subtitle: CustomTextBtn(
            //   fontWeight: FontWeight.w100,
            //   color: textAndIconColor,
            //   text:
            //       'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
            // ),
          )),
    );
  }
}
