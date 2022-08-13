import 'package:becos_kitchen/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._auth);

  final FirebaseAuth _auth;

  @override
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    }
  }
}
