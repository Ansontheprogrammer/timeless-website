import 'package:provider/provider.dart';
import 'package:timeless_app/services/auth_service.dart';
import 'package:timeless_app/ui/shared/adaptive/layout.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:timeless_app/ui/shared/utils/custom_text.dart';

class LoginWidget extends StatefulWidget {
  LoginWidget() : super();
  static const String route = '/login';

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  late bool passwordVisibility;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      pageContent: Container(
        height: MediaQuery.of(context).size.height * 0.985,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.black,
            backgroundBlendMode: BlendMode.darken,
            image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.75), BlendMode.dstATop),
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1621570277341-4fea9203f5e0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80'))),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.65,
            margin: EdgeInsets.only(bottom: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 85),
                    child:
                        CustomTextHeadline(color: Colors.white, text: 'Login')),
                Column(
                  children: [
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          fillColor: Colors.blue,
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                          labelText: 'Enter your username'),
                      controller: emailTextController,
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          fillColor: Colors.blue,
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                          labelText: 'Enter your password'),
                      controller: passwordTextController,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await AuthenticationService()
                            .auth
                            .signInWithEmailAndPassword(
                                email: emailTextController.text,
                                password: passwordTextController.text);
                      },
                      child: CustomTextBtn(
                        text: "Submit",
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
