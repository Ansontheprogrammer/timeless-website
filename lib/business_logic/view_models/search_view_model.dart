import 'package:flutter/cupertino.dart';
import 'package:timeless_app/business_logic/enums/business_search.dart';
import 'package:timeless_app/business_logic/models/query.dart';
import 'package:timeless_app/business_logic/providers/save_search_provider.dart';
import 'package:timeless_app/services/locator.dart';

/// Used for providing query searches in the search view
class SearchViewModel extends ChangeNotifier {
  QuerySearch _activeSearch =
      QuerySearch(fieldName: BusinessSearchTypes.Name, search: '');

  SaveSearchProvider saveSearchProvider = locator<SaveSearchProvider>();
  QuerySearch get activeSearch {
    return _activeSearch;
  }

  String _nameSearch = '';
  String get nameSearch {
    return _nameSearch;
  }

  String _locationSearch = '';
  String get locationSearch {
    return _locationSearch;
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

  void clearSearch(BusinessSearchTypes type) {
    if (type == BusinessSearchTypes.Name) {
      _nameSearch = '';
    } else {
      _locationSearch = '';
    }
  }

  changeActiveSearch(QuerySearch newSearch) {
    _activeSearch = newSearch;
    notifyListeners();
  }
}
