import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:timeless_app/utils/container_spacer.dart';
import 'package:timeless_app/utils/custom_section.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/widgets/footer/footer.dart';
import 'package:timeless_app/widgets/home/recommended/recommended_section.dart';
import 'package:timeless_app/widgets/home/search_bar.dart';

class LandingPageContent extends StatelessWidget {
  const LandingPageContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool displayedOnTabletOrSmaller = screenWidth < 600;

    return Expanded(
        flex: 5,
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            CustomSection(
              child: Container(
                child: const CustomTextHeadline(
                  text: 'Let me help you find a good local business',
                ),
              ),
            ),
            const CustomSection(
              child: SearchBar(),
            ),
            CustomSection(
              color: Colors.black12,
              child: !displayedOnTabletOrSmaller
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 4, child: LeftColumnRecommended()),
                        SizedBox(
                          width: 50,
                        ),
                        Expanded(
                            flex: 2,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextCaption(
                                    text: 'New',
                                  ),
                                  ContainerSpacer(),
                                  CustomTextNormal(
                                    text:
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                  ),
                                ],
                              ),
                            )),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LeftColumnRecommended(),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextCaption(
                                text: 'New',
                              ),
                              ContainerSpacer(),
                              CustomTextNormal(
                                text:
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                              ),
                            ],
                          ),
                        ),
                        // CustomTextNormal(
                        //   text:
                        //       'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        // ),
                      ],
                    ),
            ),
            CustomSection(child: MyCustomForm()),
            kIsWeb ? Footer() : Container()
          ],
        ));
  }
}

// Create a Form widget.
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
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(hintText: 'Business'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(hintText: 'Location'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(hintText: 'Website'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
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
