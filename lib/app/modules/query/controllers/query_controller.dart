import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class QueryController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void filter(String age) async {
    final result =
        // filter
        await firestore.collection('users').limit(4).orderBy('nama').get();

    if (result.docs.length > 0) {
      print('total yang di dapatkan ${result.docs.length}');

      result.docs.forEach((element) {
        var id = element.id;
        var data = element.data();

        print("ID : ${id}");
        print("Data : ${data}");
      });
    } else {
      print('tidak ada yang di dapatkan');
    }
  }
}
