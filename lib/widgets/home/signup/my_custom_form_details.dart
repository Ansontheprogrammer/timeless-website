// Create a Form widget.
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/models/business.dart';
import 'package:timeless_app/utils/container_spacer.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/utils/small_spacer.dart';
import 'package:uuid/uuid.dart';

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
    return (value) => '';
  };
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _typeController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _websiteController = TextEditingController();

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
          controller: _nameController,
          // validator: validator,
          hintText: 'Name',
        ),
        SmallSpacer(),
        CustomFormField(
          controller: _typeController,
          // validator: validator,
          hintText: 'Type of Business',
        ),
        SmallSpacer(),
        CustomFormField(
          controller: _locationController,
          hintText: 'Location',
          // validator: validator,
        ),
        SmallSpacer(),
        CustomFormField(
          controller: _websiteController,
          hintText: 'Website',
          // validator: validator,
        ),
        SmallSpacer(),
        CustomFormField(
          controller: _descriptionController,
          hintText: 'Description',
          // validator: validator,
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
                onPressed: () async {
                  // if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a success snackbar.
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Submitting Data Now')));

                  Business business = Business(
                    id: Uuid().v1(),
                    description: _descriptionController.text,
                    name: _nameController.text,
                    zipcode: _locationController.text,
                    type: _typeController.text,
                    website: _websiteController.text,
                  );
                  try {
                    await business.create(business);
                  } catch (FirebaseException) {
                    print("Error in custom form");
                  }
                  // } else {
                  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //       content: Text('There was an error in the upload')));
                  // }
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
    return TextFormField(
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
    );
  }
}
