import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:crud_firestore/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Paths.DETAIL);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: controller.selectrealtime(),
        builder: (context, snapshoot) {
          if (snapshoot.connectionState == ConnectionState.active) {
            var listalldokuement = snapshoot.data!.docs;
            return ListView.builder(
              itemCount: listalldokuement.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () => Get.toNamed(
                    Paths.EDIT,
                    arguments: listalldokuement[index].id,
                  ),
                  leading: Icon(Icons.shop),
                  trailing: IconButton(
                    onPressed: () {
                      controller.deleteProduct(listalldokuement[index].id);
                    },
                    icon: Icon(Icons.delete),
                  ),
                  title: Text(
                      'Nama Product : ${(listalldokuement[index].data() as Map<String, dynamic>)['name']}'),
                  subtitle: Text(
                      'Nama Jumlah : ${(listalldokuement[index].data() as Map<String, dynamic>)['pcs']}'),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),

      // mengambil data sekali dengan futurebuilder ( One Time database)
      // body: FutureBuilder<QuerySnapshot<Object?>>(
      //   future: controller.selectdatasekali(),
      //   builder: (context, snapshoot) {
      //     if (snapshoot.connectionState == ConnectionState.done) {
      //       var listalldokuement = snapshoot.data!.docs;
      //       return ListView.builder(
      //         itemCount: listalldokuement.length,
      //         itemBuilder: (context, index) {
      //           return ListTile(
      //             leading: Icon(Icons.shop),
      //             title: Text(
      //                 'Nama Product : ${(listalldokuement[index].data() as Map<String, dynamic>)['name']}'),
      //             subtitle: Text(
      //                 'Nama Jumlah : ${(listalldokuement[index].data() as Map<String, dynamic>)['pcs']}'),
      //           );
      //         },
      //       );
      //     } else {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //   },
      // ),
    );
  }
}
