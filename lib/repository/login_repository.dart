import 'package:becos_kitchen/model/user.dart';

abstract class LoginRepository {
  void setUser(User user);
  User getUser();
}
