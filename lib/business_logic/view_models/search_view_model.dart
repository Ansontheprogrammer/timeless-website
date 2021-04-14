import 'package:flutter/cupertino.dart';
import 'package:timeless_app/business_logic/models/query.dart';
import 'package:timeless_app/enums/business_search.dart';

/// Used for providing query searches in the search view
class SearchViewModel extends ChangeNotifier {
  QuerySearch _search =
      QuerySearch(fieldName: BusinessSearchTypes.Name, search: '');

  QuerySearch get search {
    return _search;
  }

  List<QuerySearch> _recentSearches = [];
  List<QuerySearch> get recentSearches {
    return _recentSearches;
  }

  String _nameSearch = '';
  String get nameSearch {
    return _nameSearch;
  }

  String _locationSearch = '';
  String get locationSearch {
    return _locationSearch;
  }

  saveSearch(QuerySearch search) {
    _recentSearches.add(search);
    _nameSearch = '';
    _locationSearch = '';

    notifyListeners();
  }

  removeSearch(QuerySearch search) {
    _recentSearches.remove(search);
    notifyListeners();
  }

  void changeSearch(QuerySearch searchQuery) {
    switch (searchQuery.fieldName) {
      case BusinessSearchTypes.Name:
        _nameSearch = searchQuery.search;
        break;
      case BusinessSearchTypes.Location:
        _locationSearch = searchQuery.search;
        break;
      case BusinessSearchTypes.Description:
        break;
    }
  }
}
