import 'package:flutter/widgets.dart';
import 'package:timeless_app/utils/custom_text.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: Image.asset('assets/images/logo.png'),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const _NavBarItem('Home'),
              const _NavBarItem('Search'),
              const _NavBarItem('About'),
              const _NavBarItem('Contact'),
            ],
          )
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;
  const _NavBarItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTextNormal(
          text: title,
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
