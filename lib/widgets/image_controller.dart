import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ImageController {
  Future<File> pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    final file = File(image!.path);
    return file;
  }

  Future<void> uploadImage(File fileToUpload) async {
    final storageRef = FirebaseStorage.instance.ref();
    final ref = storageRef.child("images");
    final imagesRef = ref.child("images/invitations.jpg");
    try {
      await imagesRef.putFile(fileToUpload);
    } on FirebaseException catch (e) {
      print('Não foi possível salvar a foto: ${e.code}');
    }
  }
}