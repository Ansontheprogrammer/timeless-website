import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:timeless_app/business_logic/providers/save_search_provider.dart';
import 'package:timeless_app/business_logic/view_models/search_view_model.dart';
import 'package:timeless_app/business_logic/enums/business_search.dart';
import 'package:timeless_app/services/locator.dart';
import 'package:timeless_app/ui/shared/constants.dart';
import 'package:timeless_app/ui/shared/utils/custom_section.dart';
import 'package:timeless_app/ui/shared/utils/custom_text.dart';
import 'package:timeless_app/ui/shared/adaptive/layout.dart';
import 'package:timeless_app/ui/widgets/home/hero/search_bar.dart';
import 'package:timeless_app/ui/widgets/search/recent_searches.dart';
import 'package:timeless_app/ui/widgets/search/save_search_button.dart';
import 'package:timeless_app/ui/widgets/search/search_item.dart';

/// Creates the search view for advanced searches and saving recent searches
///
/// View uses both the factory [SearchViewModel] and the [SaveSearchProvider] singleton
/// The searches will be saved from screen to screen because the [SaveSearchProvider] is a singleton
/// The search bars will be reset because the [SearchViewModel] is a factory
class SearchView extends StatelessWidget {
  SearchView();
  static const String route = '/search';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool displayedOnTabletOrSmaller = screenWidth < 800;
    return Layout(
        pageContent: MultiProvider(
            providers: [
          ListenableProvider<SearchViewModel>(
              create: (_) => locator<SearchViewModel>()),
          ListenableProvider<SaveSearchProvider>(
              create: (_) => locator<SaveSearchProvider>())
        ],
            child: Consumer<SearchViewModel>(builder: (context, model, child) {
              SaveSearchProvider saveSearchProvider =
                  Provider.of<SaveSearchProvider>(context);
              return Column(
                children: [
                  CustomSection(
                      child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextHeadline(
                            fontWeight:
                                kIsWeb ? FontWeight.normal : FontWeight.bold,
                            text: 'Business Search'),
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
                                        color: Constants.blackLargeOpacity,
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
                                  SaveSearchButton(
                                      model: model,
                                      saveSearchProvider: saveSearchProvider),
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
                                    SizedBox(
                                      height: 20,
                                    ),
                                    SaveSearchButton(
                                        model: model,
                                        saveSearchProvider: saveSearchProvider),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  )),
                  CustomSection(
                      child: Column(
                    children: [
                      if (saveSearchProvider.recentSearches.length == 0)
                        CustomTextNormal(
                            text:
                                'Looks like you have not searched anything yet'),
                      Wrap(
                          alignment: WrapAlignment.center,
                          children: saveSearchProvider.recentSearches
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
