import 'package:flutter/material.dart';
import 'package:timeless_app/ui/widgets/home/signup/my_custom_form_details.dart';

/// Creates a form container around a [ContactFormDetails] widget that will display a contact form image on desktop.
///
/// If the MediaQuery.of(context).size.width is > 1000 it will display the an image to the left of the contact form details and a [SizedBox] with width.
/// The [ContactFormDetails] size is limited using a [ContrainedBox] to a max width of 300.
class FormContainer extends StatelessWidget {
  final ContactFormDetails child;
  const FormContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (screenWidth > 1000)
          Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(1.5)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1610473068533-b68dbcd23543?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80')))),
        if (screenWidth > 1000)
          SizedBox(
            width: 25,
          ),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 300),
          child: child,
        ),
      ],
    );
  }
}
