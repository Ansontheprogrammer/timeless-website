import 'package:flutter/material.dart';

/// Wraps a child [Column] with a [Container] that has a image background for the Hero Section
class HeroContainer extends StatelessWidget {
  final Column child;
  final Color color;
  const HeroContainer({required this.child, this.color = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      padding: EdgeInsets.only(
        left: 25,
        bottom: 100,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("assets/images/hero.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
          )),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200),
        child: child,
      ),
    );
  }
}
