import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/navigator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyDeXsyybNXz0f5iDNo44SQC1XAgi8qj03c",
          authDomain: "sneaker-shoes-shop.firebaseapp.com",
          projectId: "sneaker-shoes-shop",
          storageBucket: "sneaker-shoes-shop.appspot.com",
          messagingSenderId: "45066048261",
          appId: "1:45066048261:web:a390ac8755abf482875d6c",
          measurementId: "G-8DZWN0LKXR"
        )
    );
  } else Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Quicksand',
      ),
      title: 'Sneakers Shop App',
      home: MainNavigator(),
    );
  }
}
