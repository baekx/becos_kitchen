import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/menu.dart';

class MenuDao {
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('menu');

  void saveMenu(Menu menu) {
    _collection.add(menu.toJson());
  }
}
