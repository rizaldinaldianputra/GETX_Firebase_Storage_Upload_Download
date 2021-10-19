import 'package:crud_firestore/app/modules/home/controllers/editproduct_controller.dart';
import 'package:get/get.dart';

class EditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditControoler>(
      () => EditControoler(),
    );
  }
}
