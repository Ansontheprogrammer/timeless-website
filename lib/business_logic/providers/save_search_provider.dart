import 'package:flutter/cupertino.dart';
import 'package:timeless_app/business_logic/models/query.dart';

/// Singleton - created to store the users recent searches
class SaveSearchProvider extends ChangeNotifier {
  List<QuerySearch> _recentSearches = [];
  List<QuerySearch> get recentSearches {
    return _recentSearches;
  }

  void saveSearch(QuerySearch querySearch) {
    _recentSearches.add(querySearch);
    notifyListeners();
  }

  void removeSearch(QuerySearch search) {
    _recentSearches.remove(search);
    notifyListeners();
  }
}
