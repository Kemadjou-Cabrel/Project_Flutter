import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter/screens/PageAcceuil.dart';
import 'login.dart';

class Verification extends StatelessWidget {
  static const routeName = '/';
  const Verification({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {

          if(snapshot.hasData){
            return const PageAcceuil();
          }

          else{
            return const Login();
          }
        },
      ),
    );
  }

}
