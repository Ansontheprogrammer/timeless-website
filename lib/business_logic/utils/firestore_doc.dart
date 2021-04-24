/// Creates an abstract class that will ensure models that need to be stored in the DB implement required methods and have required properties
///
/// Models need to have an 'id' that is a String
abstract class FirestoreDoc<T> {
  /// Unique identifier for document.
  abstract String id;

  /// Converts a model to JSON format to prepare for storage.
  Map<String, dynamic> toJSON();

  /// Parses from JSON into the respective model, when pulling the data in the app.
  FirestoreDoc.fromJSON(Map<String, dynamic> parsedJSON);
}
