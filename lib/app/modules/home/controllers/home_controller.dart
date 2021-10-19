import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> selectdatasekali() async {
    CollectionReference product =
        FirebaseFirestore.instance.collection('products');

    return product.get();
  }

  Stream<QuerySnapshot<Object?>> selectrealtime() {
    CollectionReference product =
        FirebaseFirestore.instance.collection('products');
    return product.snapshots();
  }

  void deleteProduct(String docId) async {
    DocumentReference docsRef = firestore.collection('products').doc(docId);

    try {
      Get.defaultDialog(
        title: 'Hapus',
        middleText: 'Data Berhasil di apus',
        onConfirm: () async {
          await docsRef.delete();
          Get.back();
        },
        textCancel: 'No',
        textConfirm: 'Yes',
      );
    } catch (e) {
      Get.defaultDialog(
        title: 'Error',
        middleText: 'Terjadi Kesalahaan',
      );
    }
  }
}
