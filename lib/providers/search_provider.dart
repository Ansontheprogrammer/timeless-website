import 'package:flutter/cupertino.dart';
import 'package:timeless_app/models/query.dart';

/// Used for providing query searches across widgets and views that use the searchbar.
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
