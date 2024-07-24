import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
// import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sneaker_shop_app/view/auth/screens/sign_up.dart';
import 'view/auth/log_screen.dart';
import 'view/navigator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    // usePathUrlStrategy();
    await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyDeXsyybNXz0f5iDNo44SQC1XAgi8qj03c",   authDomain: "sneaker-shoes-shop.firebaseapp.com",   projectId: "sneaker-shoes-shop",   storageBucket: "sneaker-shoes-shop.appspot.com",   messagingSenderId: "45066048261",   appId: "1:45066048261:web:a390ac8755abf482875d6c",   measurementId: "G-8DZWN0LKXR"
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
  
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Quicksand',
      ),
      routes: {
        // PageRoute()
      },
      title: 'Sneakers Shop App',
      home: isLogged ? MainNavigator() : SignupScreen(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      supportedLocales: [
        Locale("af"), Locale("am"), Locale("ar"), Locale("az"), Locale("be"), Locale("bg"), Locale("bn"), Locale("bs"), Locale("ca"), Locale("cs"), Locale("da"), Locale("de"), Locale("el"), Locale("en"), Locale("es"), Locale("et"), Locale("fa"), Locale("fi"), Locale("fr"), Locale("gl"), Locale("ha"), Locale("he"), Locale("hi"), Locale("hr"), Locale("hu"), Locale("hy"), Locale("id"), Locale("is"), Locale("it"), Locale("ja"), Locale("ka"), Locale("kk"), Locale("km"), Locale("ko"), Locale("ku"), Locale("ky"), Locale("lt"), Locale("lv"), Locale("mk"), Locale("ml"), Locale("mn"), Locale("ms"), Locale("nb"), Locale("nl"), Locale("nn"), Locale("no"), Locale("pl"), Locale("ps"), Locale("pt"), Locale("ro"), Locale("ru"), Locale("sd"), Locale("sk"), Locale("sl"), Locale("so"), Locale("sq"), Locale("sr"), Locale("sv"), Locale("ta"), Locale("tg"), Locale("th"), Locale("tk"), Locale("tr"), Locale("tt"), Locale("uk"), Locale("ug"), Locale("ur"), Locale("uz"), Locale("vi"), Locale("zh")
      ],
      localizationsDelegates: [
        CountryLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Quicksand',
      ),
      title: 'Sneakers Shop App',
    );
  }
}
