import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

class SearchBar extends StatefulWidget {
  const SearchBar();

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  bool loading = false;
  final String _authority = 'googleapis.com';
  final String _path = '/customsearch/v1';
  String searchResult = '';
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
        color: Colors.transparent,
        child: !loading
            ? TextField(
                textInputAction: TextInputAction.done,
                onSubmitted: (String text) async {
                  setState(() {
                    loading = true;
                  });
                  Map<String, dynamic> _params = {
                    'key': DotEnv.env['API_KEY'],
                    'cx': DotEnv.env['SEARCH_ENGINE_ID'],
                    'q': text
                  };
                  Uri url = Uri.https(_authority, _path, _params);

                  SnackBar errorSnackBar = SnackBar(
                      content: Text(
                          'Sorry we were not able to complete your search'));
                  try {
                    http.Response response = await http.get(
                      url,
                    );
                    if (response.statusCode < 300 &&
                        response.statusCode >= 200) {
                      SnackBar snackBar =
                          SnackBar(content: Text('Search successful'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      setState(() {
                        searchResult = response.body;
                      });
                      print({'search', jsonDecode(response.body)});
                    } else if (response.statusCode == 200) {
                      ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
                    }
                  } catch (err) {
                    ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
                  }
                  setState(() {
                    loading = false;
                  });
                },
                onChanged: (text) {
                  print("First text field: $text");
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20.0, right: 20.0),
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.business),
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(25.0),
                      ),
                    ),
                    hintText: searchResult == ''
                        ? 'Enter a search term'
                        : searchResult),
              )
            : Container(
                height: 50, width: 50, child: CircularProgressIndicator()),
      ),
    );
  }
}
