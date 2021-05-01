import 'package:flutter/cupertino.dart';
import 'package:timeless_app/business_logic/enums/business_search.dart';
import 'package:timeless_app/business_logic/models/query.dart';
import 'package:timeless_app/business_logic/view_models/search_view_model.dart';

/// Singleton - created to store the users recent searches
class SaveSearchProvider extends ChangeNotifier {
  List<QuerySearch> _recentSearches = [];
  List<QuerySearch> get recentSearches {
    return _recentSearches;
  }

  void saveSearch(QuerySearch querySearch, SearchViewModel model,
      BusinessSearchTypes searchType) {
    _recentSearches.add(querySearch);
    model.clearSearch(searchType);
    notifyListeners();
  }

  void removeSavedSearch(QuerySearch search) {
    _recentSearches.remove(search);
    notifyListeners();
  }
}
