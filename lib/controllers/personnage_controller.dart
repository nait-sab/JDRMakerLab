import 'package:flutter/material.dart';
import 'package:jdr_maker/firebase/firebase_service_firestore.dart';
import 'package:jdr_maker/models/personnage_model.dart';
import 'package:jdr_maker/models/projet_model.dart';
import 'package:provider/provider.dart';

/// Classe : Personnage
///
/// Type : Controller
///
/// Contient le personnage actuel
class PersonnageController extends ChangeNotifier {
  /// Personnage sélectionné
  PersonnageModel? personnage;

  void _actualiser(PersonnageModel personnage) {
    this.personnage = personnage;
    notifyListeners();
  }

  static void changerPersonnage(BuildContext context, PersonnageModel personnage) {
    Provider.of<PersonnageController>(context, listen: false)._actualiser(personnage);
  }

  /// Charger les personnages du [projet] demandé
  static Future<List<PersonnageModel>> chargerPersonnages(ProjetModel projet) async {
    List<PersonnageModel> liste = [];

    await FirebaseServiceFirestore.getListe(PersonnageModel.nomCollection, (data) {
      PersonnageModel cible = PersonnageModel.fromMap(data);
      if (cible.idProjet == projet.id) {
        liste.add(cible);
      }
    });

    return liste;
  }
}
