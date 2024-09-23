import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconClass {
  final List<Map<String, dynamic>> homeExpensesCategories = [
    {
      "name": "Gaz",
      "icon": FontAwesomeIcons.gasPump,
    },
    {
      "name": "Nourriture",
      "icon": FontAwesomeIcons.bowlFood,
    },
    {
      "name": "Spotify",
      "icon": FontAwesomeIcons.spotify,
    },
    {
      "name": "Livre",
      "icon": FontAwesomeIcons.book,
    },
    {
      "name": "Internet",
      "icon": FontAwesomeIcons.wifi,
    },
    {
      "name": "Électricité",
      "icon": FontAwesomeIcons.bolt,
    },
    {
      "name": "Eau",
      "icon": FontAwesomeIcons.water,
    },
    {
      "name": "Transports",
      "icon": FontAwesomeIcons.bus,
    },
    {
      "name": "Loisirs",
      "icon": FontAwesomeIcons.gamepad,
    },
    {
      "name": "Santé",
      "icon": FontAwesomeIcons.briefcaseMedical,
    },
    {
      "name": "Restaurant",
      "icon": FontAwesomeIcons.utensils,
    },
    {
      "name": "Voyage",
      "icon": FontAwesomeIcons.plane,
    },

    {
      "name": "Cadeaux",
      "icon": FontAwesomeIcons.gift,
    },
    {
      "name": "Abonnements",
      "icon": FontAwesomeIcons.creditCard,
    },
    {
      "name": "Salaire",
      "icon": FontAwesomeIcons.moneyBillWave,
    },
    {
      "name": "Divertissement",
      "icon": FontAwesomeIcons.film,
    },
    {
      "name": "Impôts",
      "icon": FontAwesomeIcons.receipt,
    },
    {
      "name": "Éducation",
      "icon": FontAwesomeIcons.graduationCap,
    },

    {
      "name": "Assurance",
      "icon": FontAwesomeIcons.shieldHalved,
    },

    {
      "name": "Carburant",
      "icon": FontAwesomeIcons.gasPump,
    },
    {
      "name": "Loisirs",
      "icon": FontAwesomeIcons.music,
    },
    {
      "name": "Investissement",
      "icon": FontAwesomeIcons.piggyBank,
    },
    {
      "name": "Animaux",
      "icon": FontAwesomeIcons.paw,
    },
    {
      "name": "Réparations",
      "icon": FontAwesomeIcons.wrench,
    },
    {
      "name": "Fitness",
      "icon": FontAwesomeIcons.dumbbell,
    },

    {
      "name": "Jardinage",
      "icon": FontAwesomeIcons.seedling,
    },
    {
      "name": "Netflix",
      "icon": FontAwesomeIcons.film,
    },
    {
      "name": "Musique",
      "icon": FontAwesomeIcons.headphones,
    },
    {
      "name": "Cinéma",
      "icon": FontAwesomeIcons.video,
    },
    {
      "name": "Enfants",
      "icon": FontAwesomeIcons.child,
    }

  ];

   IconData getExpenseCategoryIcon(String categoryName) {
    final category = homeExpensesCategories.firstWhere(
          (category) => category['name'] == categoryName,
      orElse: () => {"icon": FontAwesomeIcons.cartShopping},
    );
    return category['icon'];
  }


  }

