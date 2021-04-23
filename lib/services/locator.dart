import 'package:get_it/get_it.dart';
import 'package:timeless_app/business_logic/providers/category_provider.dart';
import 'package:timeless_app/business_logic/providers/save_search_provider.dart';
import 'package:timeless_app/business_logic/view_models/search_view_model.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerFactory(() => CategoryProvider());
  locator.registerFactory(() => SearchViewModel());
  locator.registerSingleton(() => SaveSearchProvider());
}
