import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_firestore/app/modules/home/controllers/editproduct_controller.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class EditView extends GetView<EditControoler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit View'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getdata(Get.arguments),
        builder: (context, snapshoot) {
          if (snapshoot.connectionState == ConnectionState.done) {
            var data = snapshoot.data?.data() as Map<String, dynamic>;
            controller.Cnameproduk.text = data['name'];
            controller.Cjumlah.text = data['pcs'];
            return Padding(
              padding: EdgeInsets.all(10),
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
                  ElevatedButton(
                      onPressed: () {
                        controller.editdata(controller.Cnameproduk.text,
                            controller.Cjumlah.text, Get.arguments);
                      },
                      child: Text('Update Data')),
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
