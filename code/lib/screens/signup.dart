import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/my_banner.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../style/colors.dart';
import '../style/fonts.dart';
import '../style/spacings.dart';
import 'login.dart';
import 'PageAcceuil.dart';


class Signup extends StatefulWidget {
  static const routeName = '/Signup';
   const Signup({super.key});

  @override
  State<Signup> createState() => SignUpState();
}

class SignUpState extends State<Signup> {
  final nom = TextEditingController();
  final prenom = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();

  void signUpUser(BuildContext context) async {

    final localContext = context;
    try {
      showDialog(
        context: localContext,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );

      // ***************Verification des erreurs*******************************
      if (nom.text.isEmpty || nom.text.length < 3) {
        throw Exception("Entrez un nom");
      }
      if (prenom.text.isEmpty || prenom.text.length < 3) {
        throw Exception("Entrez un prénom");
      }
      if (password.text.length < 6) {
        throw Exception("Entrez un mot de passe de 6 lettres minimums");
      }
      if (password.text != confirmpassword.text) {
        throw Exception("Votre mot de passe de correspond pas");
      }

      // Création de l'utilisateur
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );

      // Création de la collection pour l'utilisateur
       FirebaseFirestore.instance.collection('Users').doc(userCredential.user!.email).set({
        'nom': nom.text,
        'prenom': prenom.text,
        'email': userCredential.user!.email,
        'password': password.text,
        'Solde': 0,
        'depense': 0,
        'revenue': 0,
      });

      // Vérification et redirection de l'utilisateur
      if (!mounted) return;
      ScaffoldMessenger.of(localContext).hideCurrentMaterialBanner();
      Navigator.pop(localContext);

      if (!mounted) return;
      Navigator.pushReplacementNamed(localContext, PageAcceuil.routeName);

    } catch (e) {
      Navigator.pop(localContext);
      String errorMessage = '';

      if (e is FirebaseAuthException) {
        if (e.code == 'invalid-credential') {
          errorMessage = 'soit votre email, votre mot de passe ou les deux sont incorrects';
        } else {
          errorMessage = '${e.message}';
        }
      } else {
        errorMessage = '$e';
      }

      ErrorBanner.showError(localContext, errorMessage);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child:Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: kLogoSize,
                  height: kLogoSize,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('img/kirikoavatar.png'),
                    ),
                  ),
                ),

                const Text(
                  'Inscription',
                  style: TextStyle(
                      color: kMainColor,
                      fontSize: kTitleSize
                  ),
                ),

                const SizedBox(height: kVerticalPadding,),

                MyTextField(
                  controller: nom,
                  hintText: 'Nom',
                  obscureText: false,
                  prefixIcon: const Icon(Icons.account_circle, color: Colors.green) ,
                ),

                const SizedBox(height: kVerticalPaddingS,),
                MyTextField(
                  controller: prenom,
                  hintText: 'Prenom',
                  obscureText: false,
                  prefixIcon: const Icon(Icons.account_circle, color: Colors.green) ,
                ),

                const SizedBox(height: kVerticalPaddingS,),

                MyTextField(
                  controller: email,
                  hintText: 'Email',
                  obscureText: false,
                  prefixIcon: const Icon(Icons.email, color: Colors.green) ,

                ),

                const SizedBox(height: kVerticalPaddingS,),

                MyTextField(
                  controller: password,
                  hintText: 'Mot de passe',
                  obscureText: true,
                  prefixIcon: const Icon(Icons.password_outlined, color: Colors.green) ,
                ),

                const SizedBox(height: kVerticalPaddingS,),

                MyTextField(
                  controller: confirmpassword,
                  hintText: 'Confirmation du mot de passe',
                  obscureText: true,
                  prefixIcon: const Icon(Icons.password_outlined, color: Colors.green) ,
                ),

                const SizedBox(height: kVerticalPaddingL,),

                MyButton(onTap: () => signUpUser(context), text: "S'INSCRIRE"),

                const SizedBox(height: kVerticalPaddingL,),
                const SizedBox(height: kVerticalPaddingS,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Vous avez déjà un compte ? ",
                      style: TextStyle(
                          color: Colors.black
                      ),
                    ),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushReplacementNamed(context, Login.routeName),
                      child: const Text(
                        "Connectez-vous",
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
