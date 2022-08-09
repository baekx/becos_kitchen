import 'package:becos_kitchen/data/firebase_module.dart';
import 'package:becos_kitchen/data/shared_preferences_module.dart';
import 'package:becos_kitchen/repository/login_repository_impl.dart';
import 'package:becos_kitchen/repository/menu_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseModuleProvider = Provider.autoDispose((_) => FirebaseModule());

final menuRepositoryProvider = Provider.autoDispose(
    (ref) => MenuRepositoryImpl(ref.read(firebaseModuleProvider)));

final loginRepositoryProvider = Provider.autoDispose(
    (ref) => LoginRepositoryImpl(ref.read(sharedPreferencesProvider)));
