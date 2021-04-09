import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchBar extends StatefulWidget {
  final String hint;
  final IconData icon;
  final bool noBorder;
  const SearchBar(
      {this.noBorder = false,
      this.hint = 'Enter a search term',
      this.icon = Icons.search});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  bool _loading = false;
  String _searchResult = '';

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
    InputDecoration _withBorder = InputDecoration(
        contentPadding: EdgeInsets.only(left: 20.0, right: 20.0),
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Icon(widget.icon),
        suffixIcon: Icon(Icons.business),
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(25.0),
          ),
        ),
        hintText: widget.hint);
    InputDecoration _withoutBorder = InputDecoration(
        enabledBorder: InputBorder.none,
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Icon(widget.icon),
        suffixIcon: Icon(Icons.business),
        border: new OutlineInputBorder(),
        hintText: widget.hint);

    return FadeTransition(
      opacity: animation,
      child: Material(
        color: Colors.transparent,
        child: !_loading
            ? TextField(
                textInputAction: TextInputAction.done,
                onSubmitted: (String text) async {
                  setState(() {
                    _loading = true;
                  });

                  // SnackBar errorSnackBar = SnackBar(
                  //     content: Text(
                  //         'Sorry we were not able to complete your search'));

                  SnackBar snackBar =
                      SnackBar(content: Text('Search successful'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  setState(() {
                    // _ = response.body;
                  });
                },
                onChanged: (text) {
                  print("First text field: $text");
                },
                decoration: widget.noBorder ? _withoutBorder : _withBorder)
            : Container(
                height: 50, width: 50, child: CircularProgressIndicator()),
      ),
    );
  }
}
