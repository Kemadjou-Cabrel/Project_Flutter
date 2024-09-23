import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_flutter/screens/formulair.dart';
import '../DTO/List_icon.dart';
import 'login.dart';
import 'form_page.dart';
import 'profil.dart';

class PageAcceuil extends StatefulWidget {
  static const routeName = '/PageAccueil';
  const PageAcceuil({super.key});

  @override
  State<PageAcceuil> createState() => _PageAcceuilState();
}

class _PageAcceuilState extends State<PageAcceuil> {
  double solde = 0.0;
  double revenue = 0.0;
  double depense = 0.0;
  String nomUtilisateur = "";
  var appIcons = IconClass();

  @override
  void initState() {
    super.initState();
    fetchUserData();
    fetchTransactions();
  }

  void fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection(
          'Users').doc(user.email).get();
      if (userDoc.exists) {
        setState(() {
          nomUtilisateur = userDoc['nom'] ?? 'Utilisateur';
        });
      }
    }
  }

  void fetchTransactions() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var transactionsSnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user.email)
          .collection(
          'transactions')
          .get();

      double totalSolde = 0.0;
      double totalRevenue = 0.0;
      double totalDepense = 0.0;
      for (var doc in transactionsSnapshot.docs) {
        var data = doc.data();
        double amount = data['Prix'] ?? 0.0;

        if (data['Type'] == 'Revenus') {
          totalSolde += amount;
          totalRevenue += amount;
        } else if (data['Type'] == 'Depenses') {
          totalSolde -= amount;
          totalDepense += amount;
        }
      }
      setState(() {
        solde = totalSolde;
        revenue = totalRevenue;
        depense = totalDepense;
      });
      if (totalSolde < 0) {
        alertesolde();
      }
    }
  }

  void alertesolde() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Alerte"),
          content: const Text(
              "Votre solde est négatif. Attention à vos dépenses !"),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void dialoBuilder(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            content: Formulair(
              rafraichirTransaction: fetchTransactions,
            ),
          ),
    );
  }

  void logOut() async {
    await FirebaseAuth.instance.signOut();
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, Login.routeName);
  }

  void navigerVersProfile() {
    Navigator.pushNamed(context, ProfilePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  FormPage(onTransactionAdded: fetchTransactions),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightGreen,
        title: const FittedBox(
          fit: BoxFit.scaleDown, // Ajuste le texte pour s'adapter
          child: Text(
            'MoneyManage',
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: navigerVersProfile,
                icon: const Icon(Icons.person),
              ),
              const Text('Profil'),
            ],
          ),
          const SizedBox(width: 16),
          Row(
            children: [
              IconButton(
                onPressed: logOut,
                icon: const Icon(Icons.exit_to_app),
              ),
              const Text('Déconnexion'),
            ],
          ),
        ],
      ),
      body: SafeArea(
    child: SingleChildScrollView(
    child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          color: Colors.lightGreen[100],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'HELLO ${nomUtilisateur.isNotEmpty
                    ? nomUtilisateur
                    : 'Utilisateur'} !!!',
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(20.0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "SOLDE",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "${solde.toStringAsFixed(2)}€",
                      style: TextStyle(
                        fontSize: 44,
                        color: solde >= 0 ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Card(
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const Text(
                              "DÉPENSES",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${depense.toStringAsFixed(2)}€",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const Text(
                              "REVENUS",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${revenue.toStringAsFixed(2)}€",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Recent Transactions",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                // Fixe une hauteur maximale pour le StreamBuilder pour la rotation
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Users')
                      .doc(FirebaseAuth.instance.currentUser?.email)
                      .collection('transactions')
                      .orderBy(
                      'Date', descending: true) // Ajout de l'ordre de tri
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(child: Text(
                          'Vous n\'avez effectué aucune transaction.'));
                    }

                    var transactions = snapshot.data!.docs;
                    final DateFormat dateFormat = DateFormat(
                        'dd/MM/yyyy HH:mm:ss');
                    return ListView.builder(
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        var data = transactions[index].data() as Map<
                            String,
                            dynamic>;
                        DateTime date = data['Date']?.toDate() ?? DateTime
                            .now();
                        String formattedDate = dateFormat.format(date);

                        IconData icon = appIcons.getExpenseCategoryIcon(
                            data['Category'] ?? 'Inconnu');

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 10),
                                  color: Colors.grey.withOpacity(0.9),
                                  blurRadius: 10.0,
                                  spreadRadius: 4.0,
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: Icon(icon, color: Colors.green),
                              // Afficher l'icône ici
                              title: Row(
                                children: [
                                  Expanded(
                                      child: Text(data['Titre'] ?? 'Inconnu')),
                                  Text(
                                    "${data['Prix']?.toStringAsFixed(2) ??
                                        '0.0'}€",
                                    style: TextStyle(
                                      color: data['Type'] == 'Revenus' ? Colors
                                          .green : Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Text(formattedDate),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      )
    );
  }
}