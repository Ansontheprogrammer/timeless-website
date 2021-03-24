class Business {
  final String id;
  final String name;
  final String type;
  final String imageURL;
  final String zipcode;
  static String dbCollectionName = 'businesses';

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'name': this.name,
        'type': this.type,
        'imageURL': this.imageURL,
        'zipcode': this.zipcode
      };
  Business.fromJSON(Map<String, dynamic> parsedJSON)
      : id = parsedJSON['id'] as String,
        name = parsedJSON['name'],
        type = parsedJSON['type'],
        imageURL = parsedJSON['imageURL'],
        zipcode = parsedJSON['zipcode'];

  Business(
      {required this.id,
      required this.name,
      required this.type,
      required this.imageURL,
      required this.zipcode});
}
