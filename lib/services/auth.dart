import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final _firebaseAuth = FirebaseAuth.instance;//database oluşturuluyor

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Stream<User?> authStatus() {
    return _firebaseAuth.authStateChanges();
  }
}
