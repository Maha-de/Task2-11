import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/pages/main_splash.pages.dart';
import 'package:recipe_app/pages/splash_screen.pages.dart';
import 'package:recipe_app/provider/app_auth.provider.dart';
import 'package:recipe_app/services/ads_provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // PrefrencesService.prefs = await SharedPreferences.getInstance();
    // if (PrefrencesService.prefs != null) {
      print("Firebase successfully");
    // }
  } catch (e) {
    print("Error in Firebase ${e}");
  }
  

  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => AppAuthProvider()),
        ChangeNotifierProvider(create: (_) => AdsProvider())
      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "Hellix",
          appBarTheme: AppBarTheme(),
          primarySwatch: Colors.cyan),
      home: MainSplash(),
    );
  }
}


