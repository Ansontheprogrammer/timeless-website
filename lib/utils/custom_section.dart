import 'package:flutter/material.dart';

class CustomSection extends StatelessWidget {
  final Widget child;
  final Color color;
  const CustomSection({@required this.child, this.color = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      width: MediaQuery.of(context).size.width,
      color: this.color,
      child: Container(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1200),
          child: child,
        ),
      ),
    );
  }
}
