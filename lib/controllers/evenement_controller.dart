import 'package:flutter/material.dart';
import 'package:jdr_maker/firebase/firebase_service_firestore.dart';
import 'package:jdr_maker/models/evenement_model.dart';
import 'package:jdr_maker/models/projet_model.dart';
import 'package:provider/provider.dart';

/// Classe : Evenement
///
/// Type : Controller
///
/// Contient l'événement actuel
class EvenementController extends ChangeNotifier {
  /// Événement sélectionné
  EvenementModel? evenement;

  void _actualiser(EvenementModel evenement) {
    this.evenement = evenement;
    notifyListeners();
  }

  static void changerEvenement(BuildContext context, EvenementModel evenement) {
    Provider.of<EvenementController>(context, listen: false)._actualiser(evenement);
  }

  static EvenementModel? getEvenement(BuildContext context) {
    return Provider.of<EvenementController>(context, listen: false).evenement;
  }

  /// Charger les événements du [projet] demandé
  static Future<List<EvenementModel>> chargerEvenements(ProjetModel projet) async {
    List<EvenementModel> liste = [];

    await FirebaseServiceFirestore.getListe(EvenementModel.nomCollection, (data) {
      EvenementModel cible = EvenementModel.fromMap(data);
      if (cible.idProjet == projet.id) {
        liste.add(cible);
      }
    });

    liste.sort((a, b) => b.dateModification.compareTo(a.dateModification));
    return liste;
  }
}
