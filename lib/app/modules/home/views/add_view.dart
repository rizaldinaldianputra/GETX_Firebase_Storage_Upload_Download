import 'package:crud_firestore/app/modules/home/controllers/addproduct_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DetailView extends GetView<AddproductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.adddata(
              controller.Cnameproduk.text, controller.Cjumlah.text);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Nama Produk',
                labelText: 'Product',
              ),
              controller: controller.Cnameproduk,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Pcs',
                labelText: 'Jumlah',
              ),
              controller: controller.Cjumlah,
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}
