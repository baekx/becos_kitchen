import 'package:becos_kitchen/data/firebase_module.dart';
import 'package:becos_kitchen/repository/menu_repository_impl.dart';
import 'package:becos_kitchen/repository/user_repository.dart';
import 'package:becos_kitchen/repository/user_repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseModuleProvider = Provider.autoDispose((_) => FirebaseModule());

final menuRepositoryProvider = Provider.autoDispose(
    (ref) => MenuRepositoryImpl(ref.read(firebaseModuleProvider)));

final firebaseAuthProvider =
    Provider<FirebaseAuth>((_) => FirebaseAuth.instance);

final userRepositoryProvider = Provider<UserRepository>(
    (ref) => UserRepositoryImpl(ref.watch(firebaseAuthProvider)));
