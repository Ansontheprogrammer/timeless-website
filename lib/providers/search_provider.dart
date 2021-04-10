import 'package:flutter/cupertino.dart';
import 'package:timeless_app/models/query.dart';

class SearchProvider extends ChangeNotifier {
  QuerySearch _search = QuerySearch(fieldName: 'name', search: '');

  QuerySearch get search {
    return _search;
  }

  void changeSearch(QuerySearch search) {
    _search = search;
    notifyListeners();
  }
}
