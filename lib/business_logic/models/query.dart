import 'package:timeless_app/enums/business_search.dart';

class QuerySearch {
  final BusinessSearchTypes fieldName;
  final String search;
  const QuerySearch({required this.fieldName, required this.search});
}
