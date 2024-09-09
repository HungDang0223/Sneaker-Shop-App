import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  final _user = FirebaseFirestore.instance.collection('users');
  final _product = FirebaseFirestore.instance.collection('products');

  Future<User?>? createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      // create new user
      final res = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = <String, dynamic>{
        "uid": res.user!.uid,
        "username": res.user!.displayName ?? "so_"+res.user!.uid,
        "email": email,
        "password": password,
        "userPhoto": res.user?.photoURL ?? "",
        "address": ""
      };
      // if user is not exist, add new user to fire store
      QuerySnapshot query = await _user.where("email", isEqualTo: email).get();
      if (query.docs.isEmpty) {
        await _user.doc(res.user!.uid).set(user);
      } else {
        log('User with this email already exists.');
      }
      return res.user;
    } catch (e) {
      log("Catch error $e when create new user");
      log(e.toString());
    }
    return null;
  }

  Future<User?> signinWithEmailAndPassword(
      String email, String password) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // login
      final res = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      // save user to local
      prefs.setString('uid', res.user!.uid);
      return res.user;
    } catch (e) {
      log("Catch error $e when login");
    }
    return null;
  }

  Future<User?> signInWithGoogle() async {
    final _prefs = await SharedPreferences.getInstance();
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final userCredential = await _auth.signInWithCredential(credential);
    final user = userCredential.user;
    QuerySnapshot query = await _user.where("email", isEqualTo: user!.email).get();
    if (query.docs.isEmpty) {
      final data = <String, dynamic> {
        "uid": user.uid,
        "userName": user.displayName ?? "so_${user.uid}",
        "email": user.email,
        "userPhoto": user.photoURL,
        "address": ""
      };
      _prefs.setString("uid", user.uid);
      await _user.doc(user.uid).set(data);

    } else {
      _prefs.setString("uid", user.uid);
    }
    return user;
  }

  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      await _auth.signOut();
      await GoogleSignIn().signOut();
      prefs.remove('uid');
      log("sign out success");
    } catch (e) {
      log("Sign out catch error $e");
    }
  }

}
