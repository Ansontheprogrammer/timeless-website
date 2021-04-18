import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:timeless_app/ui/shared/custom_text.dart';

// TODO: Decouple the ClipRect and Container into category btn,
// Create a widget to show cliprect or container on mobile
// Move the category btn state to a view model
class CategoryBtn extends StatefulWidget {
  final String title;
  CategoryBtn({required this.title});

  @override
  _CategoryBtnState createState() => _CategoryBtnState();
}

class _CategoryBtnState extends State<CategoryBtn> {
  bool _active = false;

  void toggleButtonActiveState() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color textAndIconColor =
        !_active ? Theme.of(context).primaryColor : Colors.white;
    return CircularBtnOnMobile(
        active: _active,
        toggleButtonActiveState: toggleButtonActiveState,
        textAndIconColor: textAndIconColor,
        widget: widget);
  }
}

class CircularBtnOnMobile extends StatelessWidget {
  const CircularBtnOnMobile({
    Key? key,
    required this.active,
    required this.toggleButtonActiveState,
    required this.textAndIconColor,
    required this.widget,
  }) : super(key: key);

  final void Function() toggleButtonActiveState;
  final bool active;
  final Color textAndIconColor;
  final CategoryBtn widget;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool onDesktop = screenWidth > 600;

    ListTile categoryListTile = ListTile(
      dense: true,
      leading: Icon(Icons.category, color: this.textAndIconColor),
      trailing: Icon(
        this.active ? Icons.remove : Icons.add,
        color: this.textAndIconColor,
      ),
      contentPadding: EdgeInsets.all(2.0),
      title: CustomTextNormal(
        fontSize: 14.0,
        color: this.textAndIconColor,
        text: this.widget.title,
      ),
    );

    Column categoryContentsColumn =
        Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Icon(Icons.category, color: this.textAndIconColor),
      CustomTextNormal(
        fontSize: 14.0,
        color: this.textAndIconColor,
        text: this.widget.title,
      ),
      Icon(
        this.active ? Icons.remove : Icons.add,
        color: this.textAndIconColor,
      ),
    ]);

    return ClipRRect(
        borderRadius: kIsWeb
            ? BorderRadius.zero
            : BorderRadius.circular(MediaQuery.of(context).size.width / 2),
        child: Container(
          width: onDesktop
              ? MediaQuery.of(context).size.width / 5
              : kIsWeb
                  ? MediaQuery.of(context).size.width * 0.5
                  : MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.2,
          child: RaisedButton(
              onPressed: this.toggleButtonActiveState,
              splashColor: Theme.of(context).accentColor,
              color:
                  this.active ? Theme.of(context).primaryColor : Colors.white,
              child: Container(
                  padding: EdgeInsets.all(20),
                  child: kIsWeb ? categoryListTile : categoryContentsColumn)
              // ));
              ),
        ));
  }
}
