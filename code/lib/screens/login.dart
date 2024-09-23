import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter/screens/PageAcceuil.dart';
import '../components/my_banner.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../style/colors.dart';
import '../style/fonts.dart';
import '../style/spacings.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  static const routeName = '/Login';
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();
  final password = TextEditingController();

  void signUserIn() async {
    final localContext = context;
    try{
      showDialog(
          context: localContext,
          builder: (context){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
      );


      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );

      if (!mounted) return;
     ScaffoldMessenger.of(localContext).hideCurrentMaterialBanner();
      Navigator.pop(localContext);

      if (!mounted) return;
      Navigator.pushReplacementNamed(localContext, PageAcceuil.routeName);
    }
    catch (e) {
        Navigator.pop(localContext);
      String errorMessage = '';

      if (e is FirebaseAuthException) {
        if (e.code == 'invalid-credential') {
          errorMessage = 'soit votre email, votre mot de passe ou les deux sont incorrects';
        } else {
          errorMessage = 'Error: ${e.message}';
        }
      } else {
        errorMessage = 'Error: $e';
      }

      ErrorBanner.showError(localContext, errorMessage);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //logo
                Container(
                  width: kLogoSize,
                  height: kLogoSize,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("img/LOGO.png"),
                    ),
                  ),
                ),

                //titre
                const Text(
                  'Connexion',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                  ),
                ),

                const SizedBox(height: 36,),

                //username field
                MyTextField(
                  controller: email,
                  hintText: 'Email',
                  obscureText: false,
                  prefixIcon: const Icon(Icons.email, color: Colors.green),
                ),

                const SizedBox(height: kVerticalPaddingL,),

                //password field
                MyTextField(
                  controller: password,
                  hintText: 'Mot de passe',
                  obscureText: true,
                  prefixIcon: const Icon(Icons.password_outlined, color: Colors.green),
                ),

                const SizedBox(height: kVerticalPaddingL,),

                MyButton(
                  onTap: () => signUserIn(),
                  text: 'SE CONNECTER',
                ),

                const SizedBox(height: kVerticalPaddingXL,),
                const SizedBox(height: kVerticalPaddingL,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Vous n'avez pas de compte ? ",
                      style: TextStyle(
                          color: Colors.black
                      ),
                    ),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushReplacementNamed(context, Signup.routeName),
                      child: const Text(
                        "Inscrivez-vous",
                        style: TextStyle(
                            color: kTertiaryColor,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: kVerticalPaddingL,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
