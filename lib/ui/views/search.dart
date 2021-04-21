import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:timeless_app/business_logic/view_models/search_view_model.dart';
import 'package:timeless_app/business_logic/enums/business_search.dart';
import 'package:timeless_app/services/locator.dart';
import 'package:timeless_app/ui/shared/custom_section.dart';
import 'package:timeless_app/ui/shared/custom_text.dart';
import 'package:timeless_app/ui/shared/layout.dart';
import 'package:timeless_app/ui/widgets/home/hero/search_bar.dart';
import 'package:timeless_app/ui/widgets/search/businesses_found_in_query.dart';
import 'package:timeless_app/ui/widgets/search/recent_searches.dart';
import 'package:timeless_app/ui/widgets/search/search_item.dart';

class SearchView extends StatelessWidget {
  SearchView();
  static const String route = '/search';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool displayedOnTabletOrSmaller = screenWidth < 800;
    return Layout(
        pageContent: ListenableProvider(
            create: (_) => locator<SearchViewModel>(),
            child: Consumer<SearchViewModel>(builder: (context, model, child) {
              return Column(
                children: [
                  CustomSection(
                      child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextHeadline(text: 'Business Search'),
                        SizedBox(
                          height: 30,
                        ),
                        !displayedOnTabletOrSmaller
                            ? Wrap(
                                spacing: 25.0,
                                runSpacing: 25.0,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.81,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.5),
                                      border: Border.all(
                                        color: Colors.black12,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            child: SearchBar(
                                              type: BusinessSearchTypes.Name,
                                              hint: 'Search by name',
                                              noBorder: true,
                                            )),
                                        Container(
                                            width: 1,
                                            height: 20,
                                            color: Colors.black26),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            child: SearchBar(
                                              type: BusinessSearchTypes.Zipcode,
                                              hint: 'Search by Location',
                                              icon: Icons.location_pin,
                                              noBorder: true,
                                            )),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        if (model.nameSearch.isNotEmpty) {
                                          model.saveSearch(
                                              BusinessSearchTypes.Name);
                                        } else {
                                          model.saveSearch(
                                              BusinessSearchTypes.Zipcode);
                                        }
                                        if (kDebugMode)
                                          print(
                                              '${model.recentSearches} are the new recent searches');
                                      },
                                      child: CustomTextBtn(
                                        color: Colors.white,
                                        text: 'Save search',
                                      )),
                                ],
                              )
                            : Center(
                                child: Column(
                                  children: [
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        child: SearchBar(
                                          noBorder: kIsWeb ? false : true,
                                          type: BusinessSearchTypes.Name,
                                          hint: 'Search by Name',
                                        )),
                                    ConstrainedBox(
                                        constraints:
                                            BoxConstraints(maxWidth: 100),
                                        child: Divider(
                                            thickness: 1,
                                            color: Colors.black26)),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        child: SearchBar(
                                          noBorder: kIsWeb ? false : true,
                                          type: BusinessSearchTypes.Zipcode,
                                          hint: 'Search by Location',
                                          icon: Icons.location_pin,
                                        )),
                                    ElevatedButton(
                                        onPressed: () {
                                          if (model.nameSearch.isNotEmpty) {
                                            model.saveSearch(
                                                BusinessSearchTypes.Name);
                                          } else {
                                            model.saveSearch(
                                                BusinessSearchTypes.Zipcode);
                                          }
                                          if (kDebugMode)
                                            print(
                                                '${model.recentSearches} are the new recent searches');
                                        },
                                        child: CustomTextBtn(
                                          color: Colors.white,
                                          text: 'Save search',
                                        )),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  )),
                  CustomSection(
                      child: Column(
                    children: [
                      if (model.recentSearches.length == 0)
                        CustomTextNormal(
                            text:
                                'Looks like you have not searched anything yet'),
                      Wrap(
                          alignment: WrapAlignment.center,
                          children: model.recentSearches
                              .map((search) => SearchItem(
                                    querySearch: search,
                                  ))
                              .toList())
                    ],
                  )),
                  SearchedBusinessesSection(),
                ],
              );
            })));
  }
}
