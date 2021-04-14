import 'package:timeless_app/business_logic/utils/firestore_doc.dart';
import 'package:timeless_app/services/firestore_service.dart';

class Business implements FirestoreDoc {
  @override
  set id(String _id) {
    id = _id;
  }

  final String id;
  String name;
  final String type;
  // final String imageURL;
  final String zipcode;
  final String description;
  final String website;

  static String dbCollectionName = 'businesses';

  Map<String, dynamic> toJSON() => {
        'id': this.id,
        'name': this.name,
        'type': this.type,
        // 'imageURL': this.imageURL,
        'zipcode': this.zipcode,
        'website': this.website,
        'description': this.description
      };

  Business.fromJSON(Map<String, dynamic> parsedJSON)
      : id = parsedJSON['id'] as String,
        name = parsedJSON['name'],
        type = parsedJSON['type'],
        // imageURL = parsedJSON['imageURL'],
        website = parsedJSON['website'],
        description = parsedJSON['description'],
        zipcode = parsedJSON['zipcode'];

  Business(
      {required this.id,
      required this.name,
      required this.type,
      required this.website,
      // required this.imageURL,
      required this.description,
      required this.zipcode});

  static Future<void> create(Business business) async {
    // Convert business name to lowercase for storage.
    business.name = business.name.toLowerCase();
    try {
      await FirestoreService().create(business);
    } catch (FirebaseException) {
      print("Error in business model");
    }
  }

  getBusinessName() {
    return this.name[0].toUpperCase() + this.name.substring(1);
  }
}
