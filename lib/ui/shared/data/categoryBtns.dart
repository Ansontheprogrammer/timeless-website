import 'package:timeless_app/business_logic/models/category_btn.dart';

List<CategoryBtn> categoryOptionBtns = [
  'Food Services',
  'Entertainment',
  'Finance',
  'Healthcare',
  'Insurance',
  'Recreation'
].map((title) => CategoryBtn(title: title)).toList();
