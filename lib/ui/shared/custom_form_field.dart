import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeless_app/ui/shared/utils/small_spacer.dart';

class CustomFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const CustomFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    // required this.validator,
  }) : super(key: key);

  // final String? Function(String? value) Function({required String title})
  //     validator;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SmallSpacer(),
      TextFormField(
        textAlign: TextAlign.center,
        controller: this.controller,
        decoration: InputDecoration(
          labelText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          filled: true,
          fillColor: Colors.white.withOpacity(0.5),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black38),
          border: new OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: const BorderRadius.all(
              const Radius.circular(2.5),
            ),
          ),
        ),
        // validator: validator(
        //   title: hintText,
        // ),
      )
    ]);
  }
}
