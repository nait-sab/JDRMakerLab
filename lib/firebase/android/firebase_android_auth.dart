import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAndroidAuth {
  static FirebaseAuth _instance() => FirebaseAuth.instance;

  /// Créer un nouveau compte avec le [mail] et [passe] indiqué
  static Future<bool> creerCompte(String mail, String passe) async {
    try {
      await _instance().createUserWithEmailAndPassword(email: mail, password: passe);
      return true;
    } on FirebaseAndroidAuth {
      return false;
    }
  }

  /// Se connecter au compte avec le [mail] et [passe] indiqué
  static Future<bool> connexion(String mail, String passe) async {
    try {
      await _instance().signInWithEmailAndPassword(email: mail, password: passe);
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }

  /// Déconnecter le compte actuel
  static Future deconnexion() async {
    if (getUtilisateur() != null) {
      await _instance().signOut();
    }
    return;
  }

  /// Récupérer l'utilisateur si il est connecté
  static User? getUtilisateur() {
    return _instance().currentUser;
  }

  /// Mettre à jour l'utilisateur
  static Future modifierUtilisateur(String pseudo, String mail, String passe) async {
    await _instance().currentUser!.updateDisplayName(pseudo);
    await _instance().currentUser!.updateEmail(mail);
    await _instance().currentUser!.updatePassword(passe);
  }
}
