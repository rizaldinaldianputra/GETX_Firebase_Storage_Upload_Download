import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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
}
