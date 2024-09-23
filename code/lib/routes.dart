import 'package:flutter/material.dart';
import 'package:project_flutter/screens/login.dart';
import 'package:project_flutter/screens/PageAcceuil.dart';
import 'package:project_flutter/screens/profil.dart';
import 'package:project_flutter/screens/signup.dart';
import 'screens/verification.dart';



Map<String, WidgetBuilder> routes = {
  Verification.routeName : (context) => const Verification(),
  Login.routeName : (context) => const Login(),
  Signup.routeName : (context) =>    const Signup(),
  PageAcceuil.routeName:(context)=> const PageAcceuil(),
  ProfilePage.routeName : (context) =>  const ProfilePage(),

};