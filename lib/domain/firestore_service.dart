import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:timeless_app/models/query.dart';

class FirestoreService {
  /// This contains all interations with the firestore db
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _businessCollectionName = 'businesses';

  /// This will query businesses using different field names based on [QuerySearch]
  ///
  /// Will convert the search to lowercase to get around same case query issues.
  /// For ex. 'Sam' -> "sam's barbershop"
  Stream<QuerySnapshot> queryBusinesses({required QuerySearch query}) {
    String searchConvertedToLowercase = query.search.toLowerCase();
    return _firestore
        .collection(_businessCollectionName)
        .where(query.fieldName,
            isGreaterThanOrEqualTo: searchConvertedToLowercase)
        .where(query.fieldName, isLessThan: searchConvertedToLowercase + 'z')
        .snapshots();
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
    } catch (FirebaseException) {
      print("Error storing data");
    }
  }
}

abstract class FirestoreDoc {
  abstract String id;

  Map<String, dynamic> toJSON();
}
