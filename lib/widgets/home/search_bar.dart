import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchBar extends StatefulWidget {
  const SearchBar();

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Material(
        child: TextField(
          onChanged: (text) {
            print("First text field: $text");
          },
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              suffixIcon: Icon(Icons.search),
              border: new UnderlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(50.0),
                  ),
                  borderSide: new BorderSide(color: Colors.red)),
              hintText: 'Enter a search term'),
        ),
      ),
    );
  }
}
