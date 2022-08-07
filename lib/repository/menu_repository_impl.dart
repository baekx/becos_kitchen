import 'package:becos_kitchen/data/firebase_module.dart';
import 'package:becos_kitchen/model/add_menu_state.dart';
import 'package:becos_kitchen/model/menu.dart';
import 'package:becos_kitchen/repository/menu_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
  Future<void> addMenuData(AddMenuState menu) async {
    final image = menu.imageFile;
    if (image == null) return;

    try {
      Reference ref = firebaseModule.storage.ref().child("menu/${menu.name}");
      final TaskSnapshot snapshot = await ref.putFile(image);
      final imageUrl = snapshot.ref.getDownloadURL();
      imageUrl.then((value) {
        final data = {
          'name': menu.name,
          'image': value,
          'rate': menu.rate,
          'tag': menu.tag,
          'url': menu.url,
          'memo': menu.memo,
          'createdAt': menu.createdAt
        };
        firebaseModule.menuCollection.doc().set(data);
      });
    } catch (e) {
      print(e);
    }
  }
}
