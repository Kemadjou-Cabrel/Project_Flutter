import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../controllers/iconform.dart';

class Formulair extends StatefulWidget {
  final VoidCallback rafraichirTransaction; // Callback pour rafraîchir les données

  const Formulair({super.key, required this.rafraichirTransaction});

  @override
  State<Formulair> createState() => _FormulairState();
}

class _FormulairState extends State<Formulair> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _prixController = TextEditingController();
  var type = "Revenus";
  var category = "Livre";

  Future<void> soumettreTransaction() async {
    if (_formKey.currentState!.validate()) {
      try {
        User? user = FirebaseAuth.instance.currentUser;
        //Enregistrement de la transaction : add
        if (user != null) {
          await FirebaseFirestore.instance
              .collection('Users')
              .doc(user.email)
              .collection('transactions') // Sous-collection spécifique à l'utilisateur
              .add({
            'Titre': _titleController.text,
            'Prix': double.tryParse(_prixController.text) ?? 0.0,
            'Category': category,
            'Type': type,
            'Date': DateTime.now(),
          });
          widget.rafraichirTransaction(); // Appeler le callback pour rafraîchir les données
          if (!mounted) return;
          Navigator.of(context).pop();
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Une erreur est survenue : $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Titre',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Entrer le titre';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _prixController,
              decoration: const InputDecoration(
                labelText: 'Somme',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an amount';
                }
                return null;
              },
            ),
            IconForm(
              cattype: category,
              onChanged: (String? value) {
                setState(() {
                  category = value!;
                });
              },
            ),
            DropdownButtonFormField(
              value: 'Revenus',
              items: const [
                DropdownMenuItem(
                  value: 'Revenus',
                  child: Text('Revenus'),
                ),
                DropdownMenuItem(
                  value: 'Depenses',
                  child: Text('Depenses'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    type = value;
                  });
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                soumettreTransaction();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
              ),
              child: const Text(
                "Submit",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
