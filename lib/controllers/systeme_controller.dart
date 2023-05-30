import 'package:flutter/material.dart';
import 'package:jdr_maker/firebase/firebase_service_firestore.dart';
import 'package:jdr_maker/models/evenement_model.dart';
import 'package:jdr_maker/models/projet_model.dart';
import 'package:jdr_maker/models/systeme_model.dart';
import 'package:provider/provider.dart';

/// Classe : Système
///
/// Type : Controller
///
/// Contient le système actuel
class SystemeController extends ChangeNotifier {
  /// Événement sélectionné
  SystemeModel? systeme;

  void _actualiser(SystemeModel systeme) {
    this.systeme = systeme;
    notifyListeners();
  }

  static void changerEvenement(BuildContext context, SystemeModel systeme) {
    Provider.of<SystemeController>(context, listen: false)._actualiser(systeme);
  }

  static SystemeModel? getEvenement(BuildContext context) {
    return Provider.of<SystemeController>(context, listen: false).systeme;
  }

  /// Charger les événements du [projet] demandé
  static Future<List<SystemeModel>> chargerEvenements(ProjetModel projet) async {
    List<SystemeModel> liste = [];

    await FirebaseServiceFirestore.getListe(SystemeModel.nomCollection, (data) {
      SystemeModel cible = SystemeModel.fromMap(data);
      if (cible.idProjet == projet.id) {
        liste.add(cible);
      }
    });

    liste.sort((a, b) => b.dateModification.compareTo(a.dateModification));
    return liste;
  }
}
