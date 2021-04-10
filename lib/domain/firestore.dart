import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:timeless_app/models/query.dart';

class FirestoreService {
  /// This contains all interations with the firestore db
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _businessCollectionName = 'businesses';

  /// This will query businesses using different field names based on [QuerySearch]
  ///
  /// Currently only works in same case scenarios.
  /// For ex. 'Sam' -> "Sam's barbershop"
  Stream<QuerySnapshot> businessQuery({required QuerySearch query}) {
    return _firestore
        .collection(_businessCollectionName)
        .where(query.fieldName, isGreaterThanOrEqualTo: query.search)
        .where(query.fieldName, isLessThan: query.search + 'z')
        .snapshots();
  }
}
