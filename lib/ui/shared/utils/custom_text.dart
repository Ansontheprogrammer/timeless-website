import 'package:flutter/material.dart';

/// Creates a [Text] widget used commonly used through the app
///
/// This widget inherits most of it's stying from the [Theme] using it's textTheme.bodyText1 property
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
      textAlign: this.textAlign,
      maxLines: this.maxLines,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
          color: this.color,
          fontWeight: this.fontWeight,
          fontSize: this.fontSize),
    );
  }
}

/// Creates a [Text] widget used for view headers
///
/// This widget inherits most of it's stying from the [Theme] using it's textTheme.bodyText2 property
class CustomTextLarge extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final double? fontSize;

  const CustomTextLarge(
      {required this.text,
      this.color,
      this.textAlign = TextAlign.start,
      this.fontWeight = FontWeight.normal,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: this.textAlign,
      style: Theme.of(context).textTheme.bodyText2!.copyWith(
          color: this.color, fontWeight: this.fontWeight, fontSize: fontSize),
    );
  }
}

/// Creates a [Text] widget used for small text
///
/// This widget inherits most of it's stying from the [Theme] using it's textTheme.caption property
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

/// Creates a [Text] widget used for button text
///
/// This widget inherits most of it's stying from the [Theme] using it's textTheme.button property
class CustomTextBtn extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign textAlign;
  final FontWeight fontWeight;

  const CustomTextBtn(
      {required this.text,
      this.color = Colors.white,
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

/// Creates a [Text] widget used for headings throughout the app
///
/// This widget inherits most of it's stying from the [Theme] using it's textTheme.headline property
class CustomTextHeadline extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double? fontSize;
  final TextAlign align;
  const CustomTextHeadline(
      {required this.text,
      this.align = TextAlign.start,
      this.color = Colors.black,
      this.fontWeight = FontWeight.normal,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      text,
      textAlign: this.align,
      style: Theme.of(context).textTheme.headline1!.copyWith(
          color: this.color,
          fontWeight: this.fontWeight,
          fontSize: this.fontSize),
    ));
  }
}
