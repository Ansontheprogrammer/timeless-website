import 'package:timeless_app/business_logic/enums/business_search.dart';

class QuerySearch {
  final BusinessSearchTypes fieldName;
  final String search;
  const QuerySearch({required this.fieldName, required this.search});
}
