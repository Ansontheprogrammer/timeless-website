import 'package:flutter/cupertino.dart';
import 'package:timeless_app/business_logic/enums/business_search.dart';
import 'package:timeless_app/business_logic/models/query.dart';
import 'package:timeless_app/ui/shared/businesses_found_in_query.dart';

/// Creates a view model for the search screen to perform advanced searches.
///
/// Can set the current active search which is used by the [BusinessesFoundInQuery] widget to filter the list of businesses
///
/// Can currently filter the search by name and location.
/// This view model is created as a factory in the singleton to ensure every time a user comes back to the screen the search bars are cleared.
class SearchViewModel extends ChangeNotifier {
  QuerySearch _activeSearch =
      QuerySearch(fieldName: BusinessSearchTypes.Name, search: '');

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

  /// Change the current value of the search options
  void changeSearchFieldValues(QuerySearch searchQuery) {
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

  /// Clear the current search of the respective search type
  void clearSearch(BusinessSearchTypes type) {
    if (type == BusinessSearchTypes.Name) {
      _nameSearch = '';
    } else {
      _locationSearch = '';
    }
  }

  /// Set the current search to filter data by.
  void changeActiveSearch(QuerySearch newSearch) {
    _activeSearch = newSearch;
    notifyListeners();
  }
}
