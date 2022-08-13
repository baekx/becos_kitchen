import 'package:becos_kitchen/di/repository_provider.dart';
import 'package:becos_kitchen/model/person.dart';
import 'package:becos_kitchen/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userStateProvider =
    StreamProvider((ref) => ref.watch(userRepositoryProvider).authStateChanges);

final emailControllerStateProvider =
    StateProvider.autoDispose((_) => TextEditingController(text: ''));

final passwordControllerStateProvider =
    StateProvider.autoDispose((_) => TextEditingController(text: ''));

final loginViewModelProvider = StateNotifierProvider.autoDispose(
    (ref) => LoginViewModel(ref.read(userRepositoryProvider)));

class LoginViewModel extends StateNotifier<User?> {
  LoginViewModel(this._loginRepository) : super(null);

  // TODO: userStateProviderをvmに内包したい

  final UserRepository _loginRepository;

  Future<void> signIn(String email, String password) async {
    _loginRepository.signIn(email, password);
  }

  Future<void> signOut() async {
    _loginRepository.signOut();
  }

  String getUserIcon(String? uid) {
    switch (uid) {
      case 'UZEHS0qXu5YAe9cRGu6WFet7NSf1':
        return Person.baek.imagePath;
      case 'b30gb2uK3EZi41DevxI4Ls0z9u33':
        return Person.akane.imagePath;
      default:
        return 'assets/images/noImage.png';
    }
  }
}
