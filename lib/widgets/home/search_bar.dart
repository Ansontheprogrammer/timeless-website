import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: 50,
        child: TextField(
          onChanged: (text) {
            print("First text field: $text");
          },
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(8),
              fillColor: Colors.transparent,
              filled: true,
              suffixIcon: Icon(Icons.search),
              border: new UnderlineInputBorder(
                  borderSide: new BorderSide(color: Colors.red)),
              hintText: 'Enter a search term'),
        ),
      ),
    );
  }
}
