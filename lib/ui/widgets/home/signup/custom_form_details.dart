// Create a Form widget.
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:timeless_app/business_logic/models/business.dart';
import 'package:timeless_app/business_logic/providers/category_provider.dart';
import 'package:timeless_app/business_logic/providers/contact_form_provider.dart';
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
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return ListenableProvider(
      create: (context) => ContactFormProvider(),
      child: Consumer<ContactFormProvider>(
        builder: (context, provider, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomTextHeadline(
              align: TextAlign.center,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              text: 'Want your business added?',
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent),
                onPressed: () async {
                  await provider.getImage();
                },
                child: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  backgroundImage: provider.avatar == null
                      ? null
                      : FileImage(provider.avatar),
                ),
              ),
            ),
            CustomFormField(
              controller: provider.nameController,
              // validator: validator,
              hintText: 'Name',
            ),
            CustomFormField(
              controller: provider.typeController,
              // validator: validator,
              hintText: 'Type of Business',
            ),
            CustomFormField(
              controller: provider.locationController,
              hintText: 'Location',
              // validator: validator,
            ),
            CustomFormField(
              controller: provider.websiteController,
              hintText: 'Website',
              // validator: validator,
            ),
            CustomFormField(
              controller: provider.descriptionController,
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
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      // if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a success snackbar.
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Submitting Data Now')));

                      Business business = Business(
                        id: Uuid().v1(),
                        description: provider.descriptionController.text,
                        name: provider.nameController.text,
                        zipcode: provider.locationController.text,
                        type: provider.typeController.text,
                        website: provider.websiteController.text,
                      );
                      try {
                        await provider.createBusiness(
                            business, provider.avatar);
                      } catch (FirebaseException) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('There was an error in the upload')));
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
        ),
      ),
    );
  }
}
