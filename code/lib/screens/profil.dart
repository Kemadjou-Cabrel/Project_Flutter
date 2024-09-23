import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';
class ProfilePage extends StatefulWidget {
  static const routeName = '/ProfilePage';
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage> {
  User? user = FirebaseAuth.instance.currentUser;
  String nom = '';
  String prenom = '';
  String email = '';
  @override
  void initState() {
    super.initState();
    fetchUserData();
  }
  Future<void> fetchUserData() async {
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.email)
          .get();
      if (userDoc.exists) {
        setState(() {
          nom = userDoc.get('nom') ?? '';
          prenom = userDoc.get('prenom') ?? '';
          email = userDoc.get('email') ?? '';
        });
      }
    }
  }
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
          (Route<dynamic> route) => false, //  supprime toutes les routes précédentes
    );
  }
  Future<void> deleteUser() async {
    try {
      final userDocRef = FirebaseFirestore.instance.collection('Users').doc(user!.email);
      final transactionsCollection = userDocRef.collection('transactions');
      final transactionsSnapshot = await transactionsCollection.get();
      for (var doc in transactionsSnapshot.docs) {
        await doc.reference.delete();
      }
      await userDocRef.delete();
      await user!.delete();
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
            (Route<dynamic> route) => false, // Supprime toutes les routes précédentes
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erreur de suppression: $e')));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon profile'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Profile Information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Nom : $nom',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Prenom : $prenom',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Email: $email',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 40),
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: logOut,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text('Déconnexion'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: deleteUser,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text('Supprimer mon compte'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

