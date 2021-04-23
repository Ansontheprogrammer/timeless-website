import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeless_app/business_logic/models/query.dart';
import 'package:timeless_app/business_logic/providers/save_search_provider.dart';
import 'package:timeless_app/business_logic/view_models/search_view_model.dart';
import 'package:timeless_app/business_logic/enums/business_search.dart';
import 'package:timeless_app/ui/shared/custom_text.dart';

class SearchItem extends StatelessWidget {
  final QuerySearch querySearch;
  const SearchItem({
    Key? key,
    required this.querySearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchViewModel model = Provider.of<SearchViewModel>(context);
    SaveSearchProvider saveSearchProvider =
        Provider.of<SaveSearchProvider>(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          onPrimary: Colors.transparent,
          shadowColor: Colors.transparent),
      onPressed: () {
        model.changeActiveSearch(querySearch);
      },
      child: Card(
        elevation: 3,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.5),
          ),
          padding: EdgeInsets.all(20.0),
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    querySearch.fieldName == BusinessSearchTypes.Name
                        ? Icons.account_box
                        : Icons.location_pin,
                    color: Colors.black,
                    size: 20.0,
                  ),
                  CustomTextNormal(
                      text: querySearch.search, color: Colors.black),
                  IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: Colors.black,
                      ),
                      onPressed: () =>
                          saveSearchProvider.removeSearch(querySearch))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
