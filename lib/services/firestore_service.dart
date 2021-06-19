import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/foundation.dart';
import 'package:timeless_app/business_logic/models/business.dart';
import 'package:timeless_app/business_logic/models/query.dart';
import 'package:timeless_app/business_logic/utils/firestore_doc.dart';

class FirestoreService {
  /// This contains all interations with the firestore db
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _businessCollectionName = 'businesses';

  /// This will query businesses using different field names based on [QuerySearch]
  ///
  /// Will convert the search to lowercase to get around same case query issues.
  /// For ex. 'Sam' -> "sam's barbershop"
  Stream<QuerySnapshot> queryBusinesses({required QuerySearch query}) {
    if (kDebugMode)
      print('Starting query... ${query.fieldName} ${query.search} ');
    String searchConvertedToLowercase = query.search.toLowerCase();
    String fieldName =
        EnumToString.convertToString(query.fieldName).toLowerCase();
    return _firestore
        .collection(_businessCollectionName)
        .where(fieldName, isGreaterThanOrEqualTo: searchConvertedToLowercase)
        .where(fieldName, isLessThan: searchConvertedToLowercase + 'z')
        .snapshots();
  }

  Stream<Business> getBusiness({required String id}) {
    if (kDebugMode) print('Retrieving business... $id');

    return _firestore
        .collection(_businessCollectionName)
        .where('id', isEqualTo: id)
        .snapshots()
        .asyncMap((event) =>
            event.docs.map((e) => Business.fromJSON(e.data())).toList()[0]);
  }

  /// Create new business
  ///
  /// Will convert business name and description to lowercase, to ensure quering is easier
  Future<void> create(FirestoreDoc doc) async {
    try {
      await _firestore
          .collection(_businessCollectionName)
          .doc(doc.id)
          .set(doc.toJSON());
    } catch (e) {
      print("Error storing data $e");
    }
  }
}
