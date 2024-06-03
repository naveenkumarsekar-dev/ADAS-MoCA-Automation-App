import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadImage(Uint8List imageBytes, String fileName) async {
    try{Reference ref = _storage.ref().child('images/$fileName');
    UploadTask uploadTask = ref.putData(imageBytes);
    TaskSnapshot snapshot = await uploadTask;
    return await snapshot.ref.getDownloadURL();
    }catch(e){
      print('Error uploading image: $e');
      return '';
    }
  }

  Future<void> saveScore(String imageUrl, int score) async {
    await _firestore.collection('scores').add({
      'imageUrl': imageUrl,
      'score': score,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
