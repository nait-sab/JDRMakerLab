import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart' as android_firebase;
import 'package:firedart/auth/user_gateway.dart' as desktop_firebase;
import 'package:flutter/material.dart';
import 'package:jdr_maker/controllers/utilisateur_controller.dart';
import 'package:jdr_maker/firebase/android/firebase_android_auth.dart';
import 'package:jdr_maker/firebase/desktop/firebase_desktop_auth.dart';

class FirebaseServiceAuth {
  /// Créer un nouveau compte avec le [mail] et [passe] indiqué
  static Future<bool> creerCompte(String mail, String passe) async {
    return Platform.isAndroid
        ? await FirebaseAndroidAuth.creerCompte(mail, passe)
        : await FirebaseDesktopAuth.creerCompte(mail, passe);
  }

  /// Se connecter au compte avec le [mail] et [passe] indiqué
  static Future<bool> connexion(String mail, String passe) async {
    return Platform.isAndroid
        ? await FirebaseAndroidAuth.connexion(mail, passe)
        : await FirebaseDesktopAuth.connexion(mail, passe);
  }

  /// Déconnecter le compte actuel
  static Future deconnexion(BuildContext context) async {
    UtilisateurController.retirerUtilisateur(context);
    return Platform.isAndroid ? await FirebaseAndroidAuth.deconnexion() : await FirebaseDesktopAuth.deconnexion();
  }

  /// (ANDROID) Récupérer l'utilisateur si il est connecté
  static android_firebase.User? getAndroidUtilisateur() {
    return FirebaseAndroidAuth.getUtilisateur();
  }

  /// (DESKTOP) Récupérer l'utilisateur si il est connecté
  static Future<desktop_firebase.User?> getDesktopUtilisateur() async {
    return await FirebaseDesktopAuth.getUtilisateur();
  }

  /// Récupérer l'id de l'utilisateur si il est connecté
  static String getUtilisateurID() {
    if (Platform.isAndroid && FirebaseAndroidAuth.getUtilisateur() != null) {
      return FirebaseAndroidAuth.getUtilisateur()!.uid;
    } else if (Platform.isWindows) {
      return FirebaseDesktopAuth.getUtilisateurID();
    }
    return "";
  }

  /// Mettre à jour l'utilisateur (Mail impossible sur Windows)
  static Future modifierUtilisateur(String pseudo, String mail, String passe) async {
    if (Platform.isAndroid) {
      return await FirebaseAndroidAuth.modifierUtilisateur(pseudo, mail, passe);
    } else {
      return await FirebaseDesktopAuth.modifierUtilisateur(pseudo, passe);
    }
  }
}
