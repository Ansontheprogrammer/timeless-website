import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

/// Used to upload business images to Firebase Storage
class StorageService {
  Future<String> storeBusinessAvatar(String id, dynamic imageFile) async {
    try {
      var firebaseStorageRef =
          FirebaseStorage.instance.ref().child('uploads/$id/avatar.jpg');
      UploadTask uploadTask = firebaseStorageRef.putFile(imageFile);
      TaskSnapshot taskSnapshot = (await uploadTask);
      return await taskSnapshot.ref.getDownloadURL();
    } catch (err) {
      print(
          'There was an issue uploading $imageFile to storage bucket ${err.toString()}');
      return err.toString();
    }
  }
}
