
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/pages/homepage.pages.dart';
import 'package:recipe_app/pages/login.pages.dart';
import 'package:recipe_app/pages/sign_up.pages.dart';

class AppAuthProvider extends ChangeNotifier{

  GlobalKey<FormState>? formKey;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? nameController;
  bool obSecureText = true;

  void providerInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  void providerDispose() {
    emailController = null;
    passwordController = null;
    nameController = null;
    formKey = null;
    obSecureText = true;
  }

  void toggleObSecure() {
    obSecureText = !obSecureText;
    notifyListeners();
  }

  // String _username = "DefaultUsername";
  // String get username => _username;
  //
  // void updateUsername(String newUsername) {
  //   _username = newUsername;
  //   notifyListeners();
  // }

  void openRegisterPage(BuildContext context){
    providerDispose();
    Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpPage()));
  }

  void openLoginPage(BuildContext context){
    providerDispose();
    Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
  }



  Future<void> signUp(BuildContext context) async {
    try {
      if (formKey?.currentState?.validate() ?? false){
        var credentials = await
        FirebaseAuth.instance.createUserWithEmailAndPassword
          (email: emailController!.text, password: passwordController!.text);

        if(credentials.user != null) {
          await credentials.user?.updateDisplayName(nameController!.text);
          providerDispose();
          Navigator.push(context, MaterialPageRoute(builder: (_) => HomePageScreen()));
        }
      }
    }catch(e) {
      print("Error in SignUp");

    }
  }

  Future<void> signIn(BuildContext context) async {
    try {
      if (formKey?.currentState?.validate() ?? false){
        var credentials = await
        FirebaseAuth.instance.signInWithEmailAndPassword
          (email: emailController!.text, password: passwordController!.text);

        if(credentials.user != null) {
          await credentials.user?.updateDisplayName(emailController!.text);
          providerDispose();
          Navigator.push(context, MaterialPageRoute(builder: (_) => HomePageScreen()));
        }
      }
    }catch(e) {
      print("Error in Login");
    }
  }


}