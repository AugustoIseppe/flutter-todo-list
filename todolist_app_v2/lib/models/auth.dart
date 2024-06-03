import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:todolist_app_v2/exceptions/auth_exception.dart';

class Auth extends ChangeNotifier {
  
  final FirebaseAuth _firebaseAuth;
  User? _user;
  String? _token; 
  String? _email; 
  String? _uid;

  String? get userName => _user?.displayName;
  String? get userPhotoUrl => _user?.photoURL;
  String? get userEmail => _user?.email;
  String? get token => _token;
  String? get email => _email;
  String? get uid => _uid;

  Auth(this._firebaseAuth);

  Future<void> signUpWithEmailPassword(String email, String password) async {
    const String urlSignUp =
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBY89oZwnOUlyW_N8qUXQf7gM3Wur0MNkg";
    final response = await http.post(
      Uri.parse(urlSignUp),
      body: jsonEncode(
        {
          "email": email,
          "password": password,
          "returnSecureToken": true,
        },
      ),
    );
    final body = jsonDecode(response.body);
    if (body["error"] != null) {
      throw AuthException(body["error"]["message"]);
    } else {
      _token = body["idToken"];
      _email = body["email"];
      _uid = body["localId"];
    }
   
    notifyListeners();
  }

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      const String urlSignIn =
          "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBY89oZwnOUlyW_N8qUXQf7gM3Wur0MNkg";
      final response = await http.post(
        Uri.parse(urlSignIn),
        body: jsonEncode(
          {
            "email": email,
            "password": password,
            "returnSecureToken": true,
          },
        ),
      );
      final body = jsonDecode(response.body);
      if (body["error"] != null) {
        throw AuthException(body["error"]["message"]);
      } else {
        _token = body["idToken"];
        _email = body["email"];
        _uid = body["localId"];
        notifyListeners();
        return true;
      }
    } on AuthException catch (e) {
      throw AuthException(e.toString());
    }
  }

  Future<User?> googleLogin() async {
    try {
      final googleSignIn = GoogleSignIn();
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return null;
      }

      final googleAuth = await googleUser.authentication;
      final firebaseCredential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      var userCredential =
          await _firebaseAuth.signInWithCredential(firebaseCredential);

      _user = userCredential.user;
      notifyListeners();
      
      return _user;
    } on FirebaseAuthException catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
    }
    return null;
  }
}
