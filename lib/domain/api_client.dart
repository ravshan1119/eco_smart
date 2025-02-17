

import 'package:firebase_auth/firebase_auth.dart';

abstract class ApiClient {

  Future<UserCredential> signInWithGoogle();
  Future<bool> register({required String emailAddress,required String password});
}
