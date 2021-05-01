import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:timeless_app/business_logic/models/business.dart';
import 'package:timeless_app/services/firestore_service.dart';
import 'package:timeless_app/services/storage_service.dart';
import 'package:uuid/uuid.dart';

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

  File _avatar = (null as File);
  File get avatar => _avatar;

  setAvatarImage(File image) {
    _avatar = image;
    notifyListeners();
  }

  createBusiness(Business business, File image) async {
    /// Convert business name to lowercase for storage.
    business.name = business.name.toLowerCase();
    try {
      String photoURL =
          await StorageService().storeBusinessAvatar(Uuid().v1(), avatar);

      // set business image for use when pulling business data
      business.imageURL = photoURL;
      await FirestoreService().create(business);
    } catch (FirebaseException) {
      print("Error in business model");
    }
  }

  getImage() async {
    PickedFile? pickedFile = await _picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setAvatarImage(File(pickedFile.path));
      print({'No image selected.'});
    } else {}
  }
}
