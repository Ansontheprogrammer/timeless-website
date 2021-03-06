import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:timeless_app/business_logic/enums/business_search.dart';
import 'package:timeless_app/business_logic/models/query.dart';
import 'package:timeless_app/business_logic/providers/save_search_provider.dart';
import 'package:timeless_app/business_logic/view_models/search_view_model.dart';
import 'package:timeless_app/ui/shared/utils/custom_text.dart';

class SaveSearchButton extends StatelessWidget {
  const SaveSearchButton(
      {Key? key, required this.saveSearchProvider, required this.model})
      : super(key: key);

  final SaveSearchProvider saveSearchProvider;
  final SearchViewModel model;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          BusinessSearchTypes type;
          if (model.nameSearch.isNotEmpty) {
            type = BusinessSearchTypes.Name;
            saveSearchProvider.saveSearch(
                QuerySearch(fieldName: type, search: model.nameSearch),
                model,
                type);
          } else if (model.locationSearch.isNotEmpty) {
            type = BusinessSearchTypes.Zipcode;
            saveSearchProvider.saveSearch(
                QuerySearch(fieldName: type, search: model.locationSearch),
                model,
                type);
            model.clearSearch(type);
          } else {
            return;
          }
          if (kDebugMode)
            print(
                '${saveSearchProvider.recentSearches} are the new recent searches');
        },
        child: CustomTextBtn(
          color: Colors.white,
          text: 'Save search',
        ));
  }
}
