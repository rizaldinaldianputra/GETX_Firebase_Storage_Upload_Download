import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddproductController extends GetxController {
  late TextEditingController Cnameproduk;
  late TextEditingController Cjumlah;

  void onInit() {
    Cnameproduk = TextEditingController();
    Cjumlah = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    Cnameproduk.dispose();
    Cjumlah.dispose();
  }

  void adddata(String name, String pcs) async {
    CollectionReference product =
        FirebaseFirestore.instance.collection('products');

    try {
      await product.add({
        'name': name, // John Doe
        'pcs': pcs, // Stokes and Sons
      });

      Get.defaultDialog(
          title: 'Berhasil',
          middleText: 'Data Telah Di tambahkan',
          onConfirm: () {
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
}
