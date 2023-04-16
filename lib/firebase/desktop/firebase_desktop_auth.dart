import 'package:firedart/auth/exceptions.dart';
import 'package:firedart/auth/user_gateway.dart';
import 'package:firedart/firedart.dart';

class FirebaseDesktopAuth {
  static FirebaseAuth _instance() => FirebaseAuth.instance;

  /// Créer un nouveau compte avec le [mail] et [passe] indiqué
  static Future<bool> creerCompte(String mail, String passe) async {
    try {
      await _instance().signUp(mail, passe);
      return true;
    } on AuthException {
      return false;
    }
  }

  /// Se connecter au compte avec le [mail] et [passe] indiqué
  static Future<bool> connexion(String mail, String passe) async {
    try {
      await _instance().signIn(mail, passe);
      return true;
    } on AuthException {
      return false;
    }
  }

  /// Déconnecter le compte actuel
  static Future deconnexion() async {
    if (await getUtilisateur() != null) {
      _instance().signOut();
    }
    return;
  }

  /// Récupérer l'utilisateur si il est connecté
  static Future<User?> getUtilisateur() async {
    return await _instance().getUser();
  }

  /// Récupérer l'id de l'utilisateur si il est connecté
  static String getUtilisateurID() {
    return _instance().userId;
  }
}
