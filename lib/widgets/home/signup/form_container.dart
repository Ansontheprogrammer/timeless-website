import 'package:flutter/material.dart';

class FormContainer extends StatelessWidget {
  final Widget child;
  const FormContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool displayedOnTabletOrSmaller = screenWidth < 600;

    return Container(
      padding: EdgeInsets.all(25),
      margin: EdgeInsets.only(
          // right: !displayedOnTabletOrSmaller
          //     ? MediaQuery.of(context).size.width / 5
          //     : 25),
          ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400),
          child: child,
        ),
      ),
    );
  }
}
