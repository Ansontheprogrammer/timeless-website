import 'package:flutter/material.dart';
import 'package:timeless_app/utils/custom_text.dart';

class RecommendedBtn extends StatefulWidget {
  String title;
  RecommendedBtn({required this.title});

  @override
  _RecommendedBtnState createState() => _RecommendedBtnState();
}

class _RecommendedBtnState extends State<RecommendedBtn> {
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        setState(() {
          active = !this.active;
        });
      },
      splashColor: Colors.blue,
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(
              color: active
                  ? Theme.of(context).primaryColor
                  : Colors.transparent)),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 9.0, bottom: 9.0),
        child: CustomTextBtn(
          fontWeight: FontWeight.w100,
          color: active ? Theme.of(context).primaryColor : Colors.black54,
          text: widget.title,
        ),
      ),
    );
  }
}
