import 'package:becos_kitchen/data/firebase_module.dart';
import 'package:becos_kitchen/model/menu.dart';
import 'package:becos_kitchen/repository/menu_repository.dart';

class MenuRepositoryImpl implements MenuRepository {
  MenuRepositoryImpl(this.firebaseModule);

  final FirebaseModule firebaseModule;

  @override
  Future<List<Menu>> fetchMenuList() async {
    final menuRef = firebaseModule.menuCollection.withConverter<Menu>(
        fromFirestore: (snapshot, _) => Menu.fromJson(snapshot.data()!),
        toFirestore: (menu, _) => menu.toJson());
    final menuListSnapshot = await menuRef.get();
    return menuListSnapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Future<String> addMenu(Menu menu) async {
    final data = await firebaseModule.menuCollection.add(menu.toJson());
    return data.id;
  }
}
