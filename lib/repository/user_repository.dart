import 'package:becos_kitchen/model/person.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository {
  Stream<User?> get authStateChanges;
  Future<void> signIn(String email, String password);
  Future<void> signOut();
  Person get currentUser;
}
