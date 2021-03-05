import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
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
    );
  }
}
