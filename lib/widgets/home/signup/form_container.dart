import 'package:flutter/material.dart';

class FormContainer extends StatelessWidget {
  final Widget child;
  const FormContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool displayedOnTabletOrSmaller = screenWidth < 600;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (!displayedOnTabletOrSmaller)
          Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(1.5)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1610473068533-b68dbcd23543?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80')))),
        SizedBox(
          width: 25,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400),
          child: child,
        ),
      ],
    );
  }
}
