// Create a Form widget.
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/utils/custom_text.dart';

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
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
    return Container(
      width: 100.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              child: Center(
            child: CustomTextNormal(
              fontWeight: FontWeight.bold,
              text: 'Want your business added?',
            ),
          )),
          TextFormField(
            decoration: InputDecoration(hintText: 'Name'),
            validator: validator(title: 'Name'),
          ),
          TextFormField(
            decoration: InputDecoration(hintText: 'Business'),
            validator: validator(title: 'Business'),
          ),
          TextFormField(
              decoration: InputDecoration(hintText: 'Location'),
              validator: validator(title: 'Location')),
          TextFormField(
            decoration: InputDecoration(hintText: 'Website'),
            validator: validator(title: 'Website'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
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
        ],
      ),
    );
  }
}
