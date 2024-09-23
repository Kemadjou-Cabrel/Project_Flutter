import 'package:flutter/material.dart';
import 'package:project_flutter/screens/formulair.dart';

class FormPage extends StatelessWidget {
  final VoidCallback onTransactionAdded;
  const FormPage({super.key, required this.onTransactionAdded});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text(
          'Ajouter une transaction',
          style: TextStyle(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: Colors.lightGreen[100],
        padding: const EdgeInsets.all(20.0),
    child: Center(
    child: SingleChildScrollView(
    child: Formulair(rafraichirTransaction: onTransactionAdded),
    ),
    ),
      ),
    );
  }
}