import 'package:becos_kitchen/di/repository_provider.dart';
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

  final UserRepository _loginRepository;

  Future<void> signIn(String email, String password) async {
    _loginRepository.signIn(email, password);
  }

  Future<void> signOut() async {
    _loginRepository.signOut();
  }
}
