import 'package:get_it/get_it.dart';
import 'package:timeless_app/business_logic/view_models/category_view_model.dart';
import 'package:timeless_app/business_logic/view_models/search_view_model.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerFactory(() => CategoryViewModel());
  locator.registerFactory(() => SearchViewModel());
}
