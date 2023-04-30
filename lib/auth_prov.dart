import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  FirebaseAuth _fb;
  AuthProvider(this._fb);
  bool _isLoading = false;
  Stream<User?> stream() => _fb.authStateChanges();
  bool get loading => _isLoading;
  Future<String> signIn(String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();
      await _fb.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      _isLoading = false;
      notifyListeners();
      return Future.value('');
    } on FirebaseAuthException catch (ex) {
      _isLoading = false;
      notifyListeners();
      return Future.value(ex.message);
    }
  }
}
