import 'package:becos_kitchen/model/menu.dart';
import 'package:becos_kitchen/repository/menu_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MenuRepositoryImpl with MenuRepository {
  final _menusManager = FirebaseFirestore.instance.collection('menu');

  @override
  Future<List<Menu>> fetchMenuList() async {
    final menuRef = _menusManager.withConverter<Menu>(
        fromFirestore: (snapshot, _) => Menu.fromJson(snapshot.data()!),
        toFirestore: (menu, _) => menu.toJson());
    final menuListSnapshot = await menuRef.get();
    return menuListSnapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Future<String> addMenu(Menu menu) async {
    final data = await _menusManager.add(menu.toJson());
    return data.id;
  }
}
