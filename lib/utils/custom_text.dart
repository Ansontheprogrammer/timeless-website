import 'package:flutter/material.dart';

class CustomTextNormal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  const CustomTextNormal(
      {@required this.text,
      this.color = Colors.black,
      this.textAlign = TextAlign.start,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodyText1
          .copyWith(color: this.color, fontWeight: this.fontWeight),
    );
  }
}

class CustomTextLarge extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign textAlign;
  final FontWeight fontWeight;

  const CustomTextLarge(
      {@required this.text,
      this.color,
      this.textAlign = TextAlign.start,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: this.textAlign,
      style: Theme.of(context).textTheme.bodyText2.copyWith(
            color: this.color,
          ),
    );
  }
}

class CustomTextCaption extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;

  final TextAlign textAlign;

  const CustomTextCaption(
      {@required this.text,
      this.color,
      this.textAlign = TextAlign.start,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: this.textAlign,
      style: Theme.of(context).textTheme.caption.copyWith(color: this.color),
    );
  }
}

class CustomTextBtn extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign textAlign;
  final FontWeight fontWeight;

  const CustomTextBtn(
      {@required this.text,
      this.color,
      this.textAlign = TextAlign.start,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: this.textAlign,
      style: Theme.of(context).textTheme.button.copyWith(color: this.color),
    );
  }
}

class CustomTextHeadline extends StatelessWidget {
  final String text;
  const CustomTextHeadline({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      text,
      style: Theme.of(context).textTheme.headline1,
    ));
  }
}
