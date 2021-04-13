// Create a Form widget.
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/utils/container_spacer.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/utils/small_spacer.dart';

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  String? Function(String? value) Function({required String title}) validator =
      ({required String title}) {
    return (String? value) {
      return value!.isNotEmpty ? title : null;
    };
  };

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: CustomTextHeadline(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            text: 'Want your business added?',
          ),
        ),
        ContainerSpacer(),
        CustomFormField(
          validator: validator,
          hintText: 'Name',
        ),
        SmallSpacer(),
        CustomFormField(
          validator: validator,
          hintText: 'Type of Business',
        ),
        SmallSpacer(),
        CustomFormField(
          hintText: 'Location',
          validator: validator,
        ),
        SmallSpacer(),
        CustomFormField(
          hintText: 'Website',
          validator: validator,
        ),
        SmallSpacer(),
        Center(
          child: Container(
            width: kIsWeb
                ? MediaQuery.of(context).size.width * 0.25
                : MediaQuery.of(context).size.width * 0.75,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false
                  // otherwise.
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Submitting Data Now')));
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a Snackbar.
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Submitting Data Now')));
                  }
                },
                child: CustomTextBtn(
                  color: Colors.white,
                  text: 'Submit',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomFormField extends StatelessWidget {
  final String hintText;
  const CustomFormField({
    Key? key,
    required this.hintText,
    required this.validator,
  }) : super(key: key);

  final String? Function(String? value) Function({required String title})
      validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
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
      validator: validator(
        title: hintText,
      ),
    );
  }
}
