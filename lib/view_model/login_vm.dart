import 'package:becos_kitchen/data/shared_preferences_module.dart';
import 'package:becos_kitchen/model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final loginViewModelProvider =
    StateNotifierProvider.autoDispose<LoginViewModel, User?>(
        (ref) => LoginViewModel(ref.read(sharedPreferencesProvider)));

class LoginViewModel extends StateNotifier<User?> {
  LoginViewModel(this.prefs) : super(null);

  // final LoginRepository _loginRepository;
  final SharedPreferences prefs;

  Future<void> setUser(User user) async {
    await prefs.setString('user', user.name);
    state = user;
  }

  // Future<User> getUser() async {
  //   final user = await _loginRepository.getUser();
  //   return user;
  // }
}
