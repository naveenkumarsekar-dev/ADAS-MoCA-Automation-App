import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
//TO REMOVE:
// import 'package:firebase_app_check/firebase_app_check.dart';

class FirebaseStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadImageData(Uint8List imageData, String fileName) async {
    try {
      // Ensure App Check token is generated
      // await FirebaseAppCheck.instance.token;

      Reference ref = _storage.ref().child('$fileName');
      UploadTask uploadTask = ref.putData(imageData);
      await uploadTask;
      String downloadUrl = await ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print("Error uploading image to Firebase: $e");
      throw e;
    }
  }
}
