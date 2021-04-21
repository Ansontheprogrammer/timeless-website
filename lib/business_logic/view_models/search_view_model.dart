import 'package:flutter/cupertino.dart';
import 'package:timeless_app/business_logic/enums/business_search.dart';
import 'package:timeless_app/business_logic/models/query.dart';

/// Used for providing query searches in the search view
class SearchViewModel extends ChangeNotifier {
  QuerySearch _activeSearch =
      QuerySearch(fieldName: BusinessSearchTypes.Name, search: '');

  QuerySearch get activeSearch {
    return _activeSearch;
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

  saveSearch(BusinessSearchTypes type) {
    print({nameSearch, 'type', type, 'saving search'});
    if (type == BusinessSearchTypes.Name) {
      _recentSearches.add(
          QuerySearch(fieldName: BusinessSearchTypes.Name, search: nameSearch));
      _nameSearch = '';
    } else {
      _recentSearches.add(QuerySearch(
          fieldName: BusinessSearchTypes.Zipcode, search: locationSearch));
      _locationSearch = '';
    }

    notifyListeners();
  }

  dynamic removeSearch(QuerySearch search) {
    _recentSearches.remove(search);
    notifyListeners();
  }

  void changeSearch(QuerySearch searchQuery) {
    _activeSearch = searchQuery;
    switch (searchQuery.fieldName) {
      case BusinessSearchTypes.Name:
        _nameSearch = searchQuery.search;
        break;
      case BusinessSearchTypes.Zipcode:
        _locationSearch = searchQuery.search;
        break;
      case BusinessSearchTypes.Description:
        break;
    }
    notifyListeners();
  }

  changeActiveSearch(QuerySearch newSearch) {
    _activeSearch = newSearch;
    notifyListeners();
  }
}
