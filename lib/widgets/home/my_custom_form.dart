// Create a Form widget.
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
            text: 'Want your business added?',
          ),
        ),
        ContainerSpacer(),
        TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Name',
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(2.5),
              ),
            ),
          ),
          validator: validator(
            title: 'Name',
          ),
        ),
        SmallSpacer(),
        TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Business',
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(2.5),
              ),
            ),
          ),
          validator: validator(title: 'Business'),
        ),
        SmallSpacer(),
        TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Location',
              border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(2.5),
                ),
              ),
            ),
            validator: validator(title: 'Location')),
        SmallSpacer(),
        TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Website',
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(2.5),
              ),
            ),
          ),
          validator: validator(title: 'Website'),
        ),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.25,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false
                  // otherwise.
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
