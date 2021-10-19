import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditControoler extends GetxController {
  late TextEditingController Cnameproduk;
  late TextEditingController Cjumlah;
  FirebaseFirestore firebase = FirebaseFirestore.instance;

// get document data dengan id
  Future<DocumentSnapshot<Object?>> getdata(String docsId) async {
    DocumentReference docsRef = firebase.collection('products').doc(docsId);

    return docsRef.get();
  }

  void editdata(String name, String pcs, String docId) async {
    DocumentReference<Map<String, dynamic>> product =
        FirebaseFirestore.instance.collection('products').doc(docId);

    try {
      await product.update({
        'name': name, // John Doe
        'pcs': pcs, // Stokes and Sons
      });

      Get.defaultDialog(
          title: 'Berhasil',
          middleText: 'Data Telah Di edit',
          onConfirm: () {
            Get.back();
            Get.back();

            Cnameproduk.clear();
            Cjumlah.clear();
          });
    } catch (e) {
      Get.defaultDialog(
          title: 'Error',
          middleText: 'Kesalahan Terjadi',
          onConfirm: () {
            Get.back();
          });
    }
  }

  void onInit() {
    Cnameproduk = TextEditingController();
    Cjumlah = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    Cnameproduk.dispose();
    Cjumlah.dispose();
  }
}
