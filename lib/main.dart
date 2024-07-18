import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'view/log/log_screen.dart';
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
  } else {
    await Firebase.initializeApp(
      options: FirebaseOptions(
      apiKey: 'AIzaSyDeXsyybNXz0f5iDNo44SQC1XAgi8qj03c',
      appId: '1:45066048261:android:accdbec02582b344875d6c',
      messagingSenderId: 'sendid',
      projectId: 'sneaker-shoes-shop',
      storageBucket: 'myapp-b9yt18.appspot.com',
    )
  );
  }
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool isLogged = preferences.containsKey('uid');
  usePathUrlStrategy();
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Quicksand',
      ),
      title: 'Sneakers Shop App',
      home: isLogged ? MainNavigator() : LogScreen(),
  ));
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
    );
  }
}
