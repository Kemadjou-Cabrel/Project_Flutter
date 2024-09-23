## Guide d’utilisation de l’Application MoneyManagePro
------------------------------------------------------

MoneyManagePro est un projet d’école pour les applications mobiles réalisé en flutter.

Pour plus de détails lisez la suite du document. 

## 🚀 Description de l'Application 

Cette application permet aux utilisateurs de mieux gérer leur argent au quotidien. Elle est facile à utiliser et permet d'enregistrer les dépenses et les revenus, pour avoir un suivi clair de ses finances.
Avec cette application, vous pouvez voir où va votre argent en temps réel. Elle vous montre clairement si vous avez dépensé plus que prévu et si votre solde est positif ou négatif. Cela vous aide à mieux comprendre votre situation financière et à prendre de meilleures décisions pour gérer votre budget.
Que vous vouliez surveiller vos dépenses, planifier un budget, ou simplement avoir une vue d'ensemble de vos finances, cette application vous donne les outils nécessaires pour gérer votre argent facilement.

L’application MoneyManagePro est une inspiration venant de l’application Planificateur Budget Monee

Lien de l’application Planificateur Budget Monee : 
Planificateur Budget Monee dans l’App Store (apple.com)


## 🎯 Public Cible

Utilisateurs souhaitant gérer leur budget : Toute personne cherchant à suivre et à organiser ses finances personnelles.

## 🌐 Étude de l'Existant

Il existe déjà plusieurs applications qui aident à gérer l'argent, comme Mint ou YNAB. Ces applications permettent de suivre les dépenses et les revenus, mais elles peuvent être compliquées à utiliser ou coûter de l'argent.
Certaines personnes trouvent que ces applications ont trop de fonctionnalités ou qu'elles demandent de connecter un compte bancaire, ce qui peut poser des problèmes de sécurité.

Positionnement de notre application :

Notre application se veut plus simple et accessible. Elle ne demande pas de connecter un compte bancaire et elle est facile à utiliser. L'objectif est d'offrir un outil simple pour suivre les dépenses et les revenus, sans fonctionnalités inutiles ni coûts supplémentaires.

Valeur ajoutée : 

Simplicité d'utilisation : Interface épurée et facile à naviguer.

Sécurité renforcée : Pas de connexion aux comptes bancaires, donc moins de risques de sécurité.

Gratuité : Pas de frais supplémentaires pour l'utilisation de l'application.


## 📋 Fonctionnalités

En tant qu'utilisateur, je peux m'inscrire ou me connecter pour accéder à la plateforme MoneyManagerPro.

En tant qu'utilisateur, je peux ajouter une nouvelle transaction en remplissant un formulaire où je choisis la catégorie, entre la somme, indique le titre de la transaction, et sélectionne si c'est une dépense ou un revenu.

En tant qu'utilisateur, je peux consulter mon solde actuel en temps réel, en tenant compte de mes revenus et dépenses, pour savoir si je dépense trop ou si je suis en train d'économiser.

En tant qu'utilisateur, je peux accéder à mon profil pour consulter mes informations personnelles.

En tant qu'utilisateur, lorsque mon solde devient négatif, je reçois un message d'alerte pour me prévenir de la situation.

En tant qu'utilisateur, je peux supprimer mon compte si je ne souhaite plus utiliser l'application.


## 📈Technologies Utilisées

Flutter : Framework principal pour le développement de l'application.

Dart : Langage de programmation utilisé avec Flutter.

Firebase : Utilisé pour la base de données et l'authentification des utilisateurs.

## 📁 Présentation des Principaux Dossiers

Le projet Flutter se trouve dans le dossier projet-d-examen-2324-douni_cabrel_aout.

Code source de l’application : Tous les fichiers contenant le code de l'application sont situés dans le dossier lib.

DTO : Les classes représentant les catégories des dépenses se trouvent dans ce dossier.

Img : Contient les images utilisées dans l'application.

Style : Comprend les fichiers relatifs aux couleurs et fonts.

Components : Inclut banner, My_bouton (pour le style des boutons), et My_textfield (pour le style des champs de texte).

## Interface graphique de l'application 

1)	Écran  Login
   
Il s’agit de l'écran d'accueil, c’est le point d'entrée de l'application. Il présente deux champs principaux : un champ pour entrer l'adresse e-mail et un autre pour le mot de passe. Un bouton de connexion et un lien "Inscrivez-vous" est disponible, dirigeant vers un formulaire d'inscription pour créer un nouveau compte.

2)	Écran SignUp
   
Il s’agit  de l'écran d'inscription, il  comporte plusieurs champs à remplir : nom, prénom, adresse e-mail et mot de passe. Un bouton "S'inscrire" permet de créer un nouveau compte une fois les informations renseignées. Pour les utilisateurs déjà inscrits, un lien "Connectez-vous" est disponible pour accéder à l'écran de connexion.

3)	Écran PageAcceuil
   
Il s'agit de l'écran que l'utilisateur voit après s'être inscrit ou connecté. Cette page affiche le solde en haut, en rouge si le solde est négatif et en vert s'il est positif. L'utilisateur peut également voir ses dépenses et ses revenus, ainsi que les transactions récentes. En haut de la page, deux boutons sont disponibles : un pour accéder au profil et un autre pour se déconnecter de l'application.

4)	Écran Form_page
   
Il s'agit de l'écran dédié à l'ajout d'une nouvelle transaction. Ce formulaire permet à l'utilisateur de saisir les détails nécessaires pour enregistrer une transaction. L'utilisateur peut entrer un titre pour la transaction, spécifier la somme impliquée, et choisir une icône représentative. Il doit également sélectionner si la transaction est un revenu ou une dépense. Un bouton "Submit" est disponible pour valider et enregistrer la transaction.


5)	Écran Profil 

Il s'agit de la page de profil où s'affichent les informations personnelles de l'utilisateur, notamment le nom, le prénom, et le mot de passe. Au milieu de la page, deux boutons sont disponibles : un bouton "Déconnexion" pour se déconnecter de l'application, et un bouton "Supprimer mon compte" pour supprimer définitivement le compte de l'utilisateur.

## Base de données :  

Créer une base de données Firebase.

Stocker les utilisateurs dans la base de données avec leur nom, prénom, mot de passe et adresse e-mail.

Stocker les transactions dans la base de données avec leur titre, somme, catégorie, et indiquer si ce sont des revenus ou des dépenses.

Stocker les soldes, les dépenses et les revenus de chaque utilisateur.

## -------------Avancements--------------

 Application terminée.

## Rendu de l'application 

Page de connexion : 

![connexion](https://github.com/user-attachments/assets/ac1f03ed-c664-42a6-b318-48cf7bc48b5d)

Page inscription :

![inscription](https://github.com/user-attachments/assets/7d9b454e-6d08-4837-af2a-400a14a28dbf)   

Page d'acceuil :

![compte](https://github.com/user-attachments/assets/aadc604d-8c93-4ac2-949d-46990b0ef3a4)

Page profil : 

![monprofil](https://github.com/user-attachments/assets/d737c555-5559-4124-9dc7-5f000fa8ed05)

Page ajout transaction : 

![ajouttransaction](https://github.com/user-attachments/assets/ebe88388-321b-44d0-9bf3-3b16677637a8)







