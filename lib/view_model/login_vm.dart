import 'package:becos_kitchen/di/repository_provider.dart';
import 'package:becos_kitchen/model/user.dart';
import 'package:becos_kitchen/repository/login_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginViewModelProvider =
    StateNotifierProvider.autoDispose<LoginViewModel, User?>(
        (ref) => LoginViewModel(ref.read(loginRepositoryProvider)));

class LoginViewModel extends StateNotifier<User?> {
  LoginViewModel(this._loginRepository) : super(null);

  final LoginRepository _loginRepository;

  Future<void> setUser(User user) async {
    await _loginRepository.setUser(user);
    state = user;
  }
}
