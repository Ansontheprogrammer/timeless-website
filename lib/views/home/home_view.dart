import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/utils/container_spacer.dart';
import 'package:timeless_app/utils/custom_section.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/widgets/footer/footer.dart';
import 'package:timeless_app/widgets/home/landing_page_content.dart';
import 'package:timeless_app/widgets/navigation_bar/navigation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: CustomSection(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [NavigationBar(), LandingPageContent(), Footer()]),
      ),
    );
  }
}

class LeftColumnRecommended extends StatelessWidget {
  const LeftColumnRecommended({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const CustomTextCaption(
        text: 'Recommeded to you',
      ),
      const ContainerSpacer(),
      Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        alignment: WrapAlignment.start,
        direction: Axis.horizontal,
        children: <Widget>[
          Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: RaisedButton(
                splashColor: Colors.blue,
                child: CustomTextCaption(
                  text: ' Button 1 ',
                ),
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: RaisedButton(
                child: CustomTextCaption(text: ' Button 2 '),
                textColor: Colors.white,
                color: Colors.green,
                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: RaisedButton(
                child: CustomTextCaption(text: ' Button 3 '),
                textColor: Colors.white,
                color: Colors.green,
                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: RaisedButton(
                child: CustomTextCaption(text: ' Button 4 '),
                textColor: Colors.white,
                color: Colors.green,
                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: RaisedButton(
                child: CustomTextCaption(text: ' Button 5 '),
                textColor: Colors.white,
                color: Colors.green,
                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: RaisedButton(
                child: CustomTextCaption(text: ' Button 7 '),
                textColor: Colors.white,
                color: Colors.green,
                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: RaisedButton(
                child: CustomTextCaption(text: ' Button 7 '),
                textColor: Colors.white,
                color: Colors.green,
                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
              )),
        ],
      ),
    ]);
  }
}
