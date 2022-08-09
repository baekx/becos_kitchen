import 'package:becos_kitchen/model/user.dart';

abstract class LoginRepository {
  Future<void> setUser(User user);
  User? getUser();
}
