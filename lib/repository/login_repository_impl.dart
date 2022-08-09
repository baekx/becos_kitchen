import 'package:becos_kitchen/model/user.dart';
import 'package:becos_kitchen/repository/login_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl(this.prefs);

  final SharedPreferences prefs;

  @override
  Future<void> setUser(User user) async {
    await prefs.setString('user', user.name);
  }

  @override
  User? getUser() {
    final userName = prefs.getString('user');
    return User.values.firstWhere((element) => element.name == userName);
  }
}
