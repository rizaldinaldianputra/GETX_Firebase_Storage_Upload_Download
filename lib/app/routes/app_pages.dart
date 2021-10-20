import 'package:get/get.dart';

import 'package:crud_firestore/app/modules/query/bindings/query_binding.dart';
import 'package:crud_firestore/app/modules/query/views/query_view.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.QUERY,
      page: () => QueryView(),
      binding: QueryBinding(),
    ),
  ];
}
