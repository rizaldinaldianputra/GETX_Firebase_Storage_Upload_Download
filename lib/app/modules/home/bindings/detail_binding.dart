import 'package:crud_firestore/app/modules/home/controllers/addproduct_controller.dart';
import 'package:get/get.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddproductController>(
      () => AddproductController(),
    );
  }
}
