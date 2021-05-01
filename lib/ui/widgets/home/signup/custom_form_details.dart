// Create a Form widget.
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/business_logic/models/business.dart';
import 'package:timeless_app/ui/shared/custom_form_field.dart';
import 'package:timeless_app/ui/shared/utils/custom_text.dart';
import 'package:timeless_app/ui/shared/utils/small_spacer.dart';
import 'package:uuid/uuid.dart';

class ContactFormDetails extends StatefulWidget {
  @override
  ContactFormDetailsState createState() {
    return ContactFormDetailsState();
  }
}

class ContactFormDetailsState extends State<ContactFormDetails> {
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
        CustomFormField(
          controller: _nameController,
          // validator: validator,
          hintText: 'Name',
        ),
        CustomFormField(
          controller: _typeController,
          // validator: validator,
          hintText: 'Type of Business',
        ),
        CustomFormField(
          controller: _locationController,
          hintText: 'Location',
          // validator: validator,
        ),
        CustomFormField(
          controller: _websiteController,
          hintText: 'Website',
          // validator: validator,
        ),
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
                    await Business.storeInDB(business);
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
