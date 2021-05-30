import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:timeless_app/business_logic/models/business.dart';
import 'package:timeless_app/services/firestore_service.dart';
import 'package:timeless_app/services/storage_service.dart';
import 'package:uuid/uuid.dart';
import "package:universal_html/html.dart" as html;

/// Used for providing query searches in the search view
class ContactFormProvider extends ChangeNotifier {
  String? Function(String? value) Function({required String title}) validator =
      ({required String title}) {
    return (value) => '';
  };
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _typeController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _websiteController = TextEditingController();

  TextEditingController get nameController => _nameController;
  TextEditingController get descriptionController => _descriptionController;
  TextEditingController get typeController => _typeController;
  TextEditingController get locationController => _locationController;
  TextEditingController get websiteController => _websiteController;

  ImagePicker _picker = ImagePicker();

  String _avatar = '';
  String get avatar => _avatar;

  setAvatarImage(String image) {
    _avatar = image;
    notifyListeners();
  }

  createBusiness(Business business) async {
    /// Convert business name to lowercase for storage.
    business.name = business.name.toLowerCase();

    /// Use dart:io if we are uploading on mobile app and universal_html if on web
    dynamic imageToUpload = kIsWeb ? html.File([], avatar) : File(avatar);

    print("About to store business image ...");
    try {
      String photoURL = await StorageService()
          .storeBusinessAvatar(Uuid().v1(), imageToUpload);

      // set business image for use when pulling business data
      business.imageURL = photoURL;
      print("Creating business ...");

      await FirestoreService().create(business);
    } on FirebaseException catch (e) {
      print({"Error creating new business", e.message});
    }
  }

  getImage() async {
    PickedFile? pickedFile = await _picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setAvatarImage(pickedFile.path);
    } else {
      print({'No image selected.'});
    }
  }
}
