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
        "username": "so_" + res.user!.uid,
        "email": email,
        "password": password
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

  Future<UserCredential> signInWithGoogle() async {
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

    // Once signed in, return the UserCredential
    return await _auth.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      await _auth.signOut();
      prefs.remove('uid');
      log("sign out success");
    } catch (e) {
      log("Sign out catch error $e");
    }
  }

  Future<void> addProduct() async {
    try {
      const product = <String, dynamic>{
        "brand": "Nike",
        "productName": "AIR JORDAN LOW",
        "modelColor": "brown",
        "color": "Color(0xffD68043)",
        "price": 150.00,
        "imgUrl":
            "https://firebasestorage.googleapis.com/v0/b/sneaker-shoes-shop.appspot.com/o/shoes%2Fnike%2Fnike7.png?alt=media",
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tincidunt laoreet enim, eget sodales ligula semper at. Sed id aliquet eros, nec vestibulum felis. Nunc maximus aliquet aliquam. Quisque eget sapien at velit cursus tincidunt. Duis tempor lacinia erat eget fermentum."
      };
      await _product.add(product);
      log("add product success");
    } catch (e) {
      log("add prodcut catch error $e");
    }
  }
}
