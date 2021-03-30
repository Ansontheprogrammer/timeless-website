import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeless_app/utils/custom_section.dart';
import 'package:timeless_app/utils/custom_text.dart';
import 'package:timeless_app/widgets/home/signup/form_container.dart';
import 'package:timeless_app/widgets/home/hero/hero_section.dart';
import 'package:timeless_app/widgets/home/signup/my_custom_form.dart';
import 'package:timeless_app/widgets/navigation/app/custom_tab_bar.dart';
import 'package:timeless_app/widgets/home/landing_page_content.dart';
import 'package:timeless_app/widgets/navigation/drawer/drawer.dart';
import 'package:timeless_app/widgets/navigation/footer/footer.dart';
import 'package:timeless_app/widgets/navigation/nav-bar/navigation_bar.dart';

class HomeView extends StatelessWidget {
  HomeView();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void _closeDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !kIsWeb
          ? AppBar(
              title: CustomTextNormal(
                  text: 'Timeless on an App', color: Colors.white),
              backgroundColor: Colors.black87,
            )
          : PreferredSize(
              child: Container(),
              preferredSize: Size(
                0,
                0,
              )),
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          if (kIsWeb)
            SliverToBoxAdapter(
                child: NavigationBar(
              openDrawer: _openDrawer,
              closeDrawer: _closeDrawer,
            )),
          SliverToBoxAdapter(
            child: HeroSection(),
          ),
          LandingPageContent(),
          SliverToBoxAdapter(
            child: CustomSection(
                color: Colors.black.withOpacity(0.05),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ContactForm(),
                )),
          ),
          if (kIsWeb) SliverToBoxAdapter(child: Footer()),
          SliverToBoxAdapter(
            child: !kIsWeb ? CustomTabBar() : Container(),
          ),
        ],
      ),
    );
  }
}

class ContactForm extends StatelessWidget {
  const ContactForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool displayedOnTabletOrSmaller = screenWidth < 600;

    if (!displayedOnTabletOrSmaller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1495603889488-42d1d66e5523?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1051&q=80'))),
          ),
          FormContainer(child: MyCustomForm()),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1495603889488-42d1d66e5523?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1051&q=80'))),
          ),
          FormContainer(child: MyCustomForm()),
        ],
      );
    }
  }
}
