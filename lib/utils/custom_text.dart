import 'package:flutter/material.dart';

class CustomTextNormal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final int maxLines;
  final double fontSize;
  const CustomTextNormal(
      {required this.text,
      this.fontSize = 18.0,
      this.color = Colors.black,
      this.textAlign = TextAlign.start,
      this.fontWeight = FontWeight.normal,
      this.maxLines = 4});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: this.maxLines,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
          color: this.color,
          fontWeight: this.fontWeight,
          fontSize: this.fontSize),
    );
  }
}

class CustomTextLarge extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign textAlign;
  final FontWeight fontWeight;

  const CustomTextLarge(
      {required this.text,
      this.color,
      this.textAlign = TextAlign.start,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: this.textAlign,
      style: Theme.of(context).textTheme.bodyText2!.copyWith(
            color: this.color,
          ),
    );
  }
}

class CustomTextCaption extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight fontWeight;
  final double? fontSize;
  final TextAlign textAlign;

  const CustomTextCaption(
      {required this.text,
      this.fontSize,
      this.color,
      this.textAlign = TextAlign.start,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: this.textAlign,
      style: Theme.of(context)
          .textTheme
          .caption!
          .copyWith(color: this.color, fontSize: this.fontSize),
    );
  }
}

class CustomTextBtn extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign textAlign;
  final FontWeight fontWeight;

  const CustomTextBtn(
      {required this.text,
      this.color,
      this.textAlign = TextAlign.start,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: this.textAlign,
      style: Theme.of(context).textTheme.button!.copyWith(color: this.color),
    );
  }
}

class CustomTextHeadline extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double? fontSize;
  const CustomTextHeadline(
      {required this.text,
      this.color = Colors.black,
      this.fontWeight = FontWeight.normal,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      text,
      style: Theme.of(context).textTheme.headline1!.copyWith(
          color: this.color,
          fontWeight: this.fontWeight,
          fontSize: this.fontSize),
    ));
  }
}
