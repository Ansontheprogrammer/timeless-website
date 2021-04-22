import 'package:flutter/cupertino.dart';
import 'package:timeless_app/business_logic/models/category_btn.dart';
import 'package:timeless_app/ui/shared/data/categoryBtns.dart';

/// Used for providing query searches in the search view
class CategoryProvider extends ChangeNotifier {
  int _limit = 2;
  int get limit {
    return _limit;
  }

  List<CategoryBtn> _activeCategoryBtns = [];
  List<CategoryBtn> get activeCategoryBtns => _activeCategoryBtns;

  void addActiveCategoryBtn(CategoryBtn btn) {
    _activeCategoryBtns.add(btn);
    notifyListeners();
  }

  void removeActiveCategoryBtn(CategoryBtn btn) {
    _activeCategoryBtns.remove(btn);
    notifyListeners();
  }

  void increaseLimit() {
    if (_limit >= categoryOptionBtns.length) {
      _limit = categoryOptionBtns.length;
    } else {
      _limit += 2;
    }

    notifyListeners();
  }
}
