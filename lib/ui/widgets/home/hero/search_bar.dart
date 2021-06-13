import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:timeless_app/business_logic/models/query.dart';
import 'package:timeless_app/business_logic/view_models/search_view_model.dart';
import 'package:timeless_app/business_logic/enums/business_search.dart';
import 'package:timeless_app/ui/providers/text_input_provider.dart';

/// This widget requires for there to be a provider of a [SearchViewModel]
class SearchBar extends StatefulWidget {
  final String hint;
  final BusinessSearchTypes type;
  final IconData icon;
  final bool noBorder;
  const SearchBar(
      {this.noBorder = false,
      required this.type,
      this.hint = 'Enter a search term',
      this.icon = Icons.search});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  bool _loading = false;
  Timer? _debounce;

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
    _debounce?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SearchViewModel query =
        Provider.of<SearchViewModel>(context, listen: false);
    TextInputProvider inputProvider =
        Provider.of<TextInputProvider>(context, listen: false);
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
                onTap: inputProvider.toggleIsFocused,
                onEditingComplete: inputProvider.toggleIsFocused,
                onChanged: (text) async {
                  /// Setting a debounce to ensure that is waits 1 second after the user finishing editing to change the search query.
                  if (_debounce?.isActive ?? false) _debounce!.cancel();
                  _debounce = Timer(const Duration(milliseconds: 1000), () {
                    query.changeSearchFieldValues(
                        QuerySearch(fieldName: widget.type, search: text));
                  });
                },
                decoration: widget.noBorder ? _withoutBorder : _withBorder)
            : Container(
                height: 50, width: 50, child: CircularProgressIndicator()),
      ),
    );
  }
}
