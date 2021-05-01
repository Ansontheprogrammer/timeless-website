import 'package:timeless_app/business_logic/models/category_btn.dart';

List<CategoryBtn> categoryOptionBtns = [
  'Cosmetology',
  'Entertainment',
  'Restaurant',
  'Tech',
  'Mechanic',
].map((title) => CategoryBtn(title: title)).toList();
