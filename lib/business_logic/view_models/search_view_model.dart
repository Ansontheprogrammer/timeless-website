import 'package:flutter/cupertino.dart';
import 'package:timeless_app/business_logic/models/business.dart';
import 'package:timeless_app/business_logic/models/query.dart';
import 'package:timeless_app/services/firestore_service.dart';

/// Used for providing query searches across widgets and views that use the searchbar.
class SearchViewModel extends ChangeNotifier {
  QuerySearch _search = QuerySearch(fieldName: 'name', search: '');

  dynamic get search {
    return _search;
  }

  void changeSearch(dynamic search) {
    _search = search;
    notifyListeners();
  }

  Future<void> create(Business business) async {
    try {
      await FirestoreService().create(business);
    } catch (FirebaseException) {
      print("Error in business model");
    }
  }
}
