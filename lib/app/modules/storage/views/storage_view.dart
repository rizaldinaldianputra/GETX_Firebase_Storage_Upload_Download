import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/storage_controller.dart';

class StorageView extends GetView<StorageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.uploadmulti();
        },
        child: Icon(Icons.get_app),
      ),
      appBar: AppBar(
        title: Text('StorageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'StorageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
