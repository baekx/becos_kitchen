import 'package:becos_kitchen/data/firebase_module.dart';
import 'package:becos_kitchen/model/add_menu_state.dart';
import 'package:becos_kitchen/model/menu_model.dart';
import 'package:becos_kitchen/repository/menu_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class MenuRepositoryImpl implements MenuRepository {
  MenuRepositoryImpl(this.firebaseModule);

  final FirebaseModule firebaseModule;

  @override
  Stream<QuerySnapshot<MenuModel>> menuListSnapshot() {
    final menuRef = firebaseModule.menuCollection.withConverter<MenuModel>(
        fromFirestore: (snapshot, _) => MenuModel.fromJson(snapshot.data()!),
        toFirestore: (menu, _) => menu.toJson());
    final menuListSnapshot =
        menuRef.orderBy('createdAt', descending: true).snapshots();
    return menuListSnapshot;
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
          'rateAkane': menu.rateAkane,
          'rateBaek': menu.rateBaek,
          'tag': menu.tag,
          'url': menu.url,
          'memo': menu.memo,
          'createdAt': menu.createdAt,
          'uid': menu.uid,
        };
        firebaseModule.menuCollection.doc().set(data);
      });
    } catch (e) {
      print(e);
    }
  }
}
