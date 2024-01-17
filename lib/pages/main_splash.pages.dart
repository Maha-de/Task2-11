
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/pages/homepage.pages.dart';
import 'package:recipe_app/pages/login.pages.dart';
import 'package:recipe_app/pages/splash_screen.pages.dart';

class MainSplash extends StatefulWidget {
  const MainSplash({super.key});

  @override
  State<MainSplash> createState() => _MainSplashState();
}

class _MainSplashState extends State<MainSplash> {


  @override
  void initState() {
    initSplash();
    super.initState();
  }


  void initSplash() async {
    
    await Future.delayed(const Duration(seconds: 3));
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if(user == null){
        Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
      }else{
        Navigator.push(context, MaterialPageRoute(builder: (_) => HomePageScreen()));

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0d0e0e),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("images/background.png"),
                fit: BoxFit.cover)
        ),
        child: Center(
          child: Container(child: Image.asset("images/logo3.png")),
        ),
      ),
    );
  }
}
