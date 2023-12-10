import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseFileStorage {
  final firebaseStorage = FirebaseStorage.instance;

  Future<String> uploadProfileImage({
    required String userId,
    required File image,
    required String imageName,
  }) async {
    final ref = firebaseStorage
        .ref()
        .child('profiles/$userId/$imageName')
        .putFile(image);
    TaskSnapshot snapshot = await ref;
    return await snapshot.ref.getDownloadURL();
  }

  Future<String> uploadPostImage({
    required String userId,
    required File image,
    required String imageName,
  }) async {
    final ref =
        firebaseStorage.ref().child('posts/$userId/$imageName').putFile(image);
    TaskSnapshot snapshot = await ref;
    return await snapshot.ref.getDownloadURL();
  }

  Future<String> uploadjobpostingCoverImage({
    required String userId,
    required File image,
    required String imageName,
  }) async {
    final ref = firebaseStorage
        .ref()
        .child('jobpostings/$userId/$imageName')
        .putFile(image);
    TaskSnapshot snapshot = await ref;
    return await snapshot.ref.getDownloadURL();
  }

  Future<String> uploadFile({
    required String userId,
    required File file,
    required String fileName,
  }) async {
    final ref = firebaseStorage
        .ref()
        .child('deliveries/$userId/$fileName')
        .putFile(file);
    TaskSnapshot snapshot = await ref;
    return await snapshot.ref.getDownloadURL();
  }
}
