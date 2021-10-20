import 'package:get/get.dart';

import 'package:crud_firestore/app/modules/home/bindings/detail_binding.dart';
import 'package:crud_firestore/app/modules/home/bindings/edit_binding.dart';
import 'package:crud_firestore/app/modules/home/bindings/home_binding.dart';
import 'package:crud_firestore/app/modules/home/views/add_view.dart';
import 'package:crud_firestore/app/modules/home/views/edit_view.dart';
import 'package:crud_firestore/app/modules/home/views/home_view.dart';
import 'package:crud_firestore/app/modules/query/bindings/query_binding.dart';
import 'package:crud_firestore/app/modules/query/views/query_view.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.DETAIL,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: Routes.EDIT,
      page: () => EditView(),
      binding: EditBinding(),
    ),
    GetPage(
      name: Routes.QUERY,
      page: () => QueryView(),
      binding: QueryBinding(),
    ),
  ];
}
