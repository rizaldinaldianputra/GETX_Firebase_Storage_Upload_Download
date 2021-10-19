import 'package:crud_firestore/app/modules/home/bindings/detail_binding.dart';
import 'package:crud_firestore/app/modules/home/bindings/edit_binding.dart';
import 'package:crud_firestore/app/modules/home/views/add_view.dart';
import 'package:crud_firestore/app/modules/home/views/edit_view.dart';
import 'package:get/get.dart';

import 'package:crud_firestore/app/modules/home/bindings/home_binding.dart';
import 'package:crud_firestore/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Paths.DETAIL,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: Paths.EDIT,
      page: () => EditView(),
      binding: EditBinding(),
    ),
  ];
}
