// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:timeless_app/business_logic/models/business.dart';
// import 'package:timeless_app/business_logic/models/query.dart';
// import 'package:timeless_app/enums/business_search.dart';

// import 'package:timeless_app/services/firestore_service.dart';
// import 'package:timeless_app/ui/widgets/search/search_item.dart';

// class BusinessesFoundInQuery extends StatelessWidget {
//   const BusinessesFoundInQuery({
//     Key? key,
//     required this.currentSearch,
//   }) : super(key: key);

//   final QuerySearch currentSearch;

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirestoreService().queryBusinesses(
//           query: QuerySearch(
//               fieldName: BusinessSearchTypes.Name,
//               search: currentSearch.search)),
//       builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         }
//         List<Business> foundBusinesses = snapshot.data!.docs
//             .map((snap) => Business.fromJSON(snap.data()!))
//             .toList();
//         return Wrap(
//             alignment: WrapAlignment.center,
//             children: foundBusinesses
//                 .map((business) => SearchItem(
//                     searchType: BusinessSearchTypes.Name, text: ,: business))
//                 .toList());
//       },
//     );
//   }
// }
