import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:get/get.dart';
import 'dart:convert' show utf8;
import 'dart:typed_data' show Uint8List;
import 'dart:io';

class StorageController extends GetxController {
  void downloadstorage() async {
    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;

// nilai root dari suatu storage
    var myRef = storage.ref();

// mengambil data dalam storage
    var mylist = await myRef.list();

    print("Banyak Data ${mylist.items.length}");

    mylist.items.forEach((element) async {
      final url = await storage.ref(element.name).getDownloadURL();

      print(url);
    });
  }

  Future<void> uploadString() async {
    // type base64
    String dataUrl = 'data:text/plain;base64,SGVsbG8sIFdvcmxkIQ==';

    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('uploads/hello-world.text')
          .putString(dataUrl, format: firebase_storage.PutStringFormat.dataUrl);
    } on firebase_storage.FirebaseException catch (e) {
      print(e);
    }
  }

  void uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      print(file);
      String filename = result.files.first.name;

// fungsi upload ke cloude_firestore
      try {
        await firebase_storage.FirebaseStorage.instance
            .ref('upload/${filename}')
            .putFile(file);

        Get.defaultDialog(
          title: 'Berhasil',
          middleText: 'Data Berhasil di upload',
        );
      } on firebase_storage.FirebaseException catch (e) {
        print(e);
        // e.g, e.code == 'canceled'
      }
    } else {
      print('user membatalkan');
      // User canceled the picker
    }
  }

  void uploadmulti() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      result.files.forEach((element) async {
        String name = element.name;
        File file = File(element.path!);
        try {
          await firebase_storage.FirebaseStorage.instance
              .ref('upload/${name}/')
              .putFile(file);

          Get.defaultDialog(
            title: 'Berhasil',
            middleText: 'Data Berhasil di upload',
          );
        } on firebase_storage.FirebaseException catch (e) {
          print(e);
          // e.g, e.code == 'canceled'
        }
      });

// fungsi upload ke cloude_firestore

    } else {
      print('user membatalkan');
      // User canceled the picker
    }
  }
}
