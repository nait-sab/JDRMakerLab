import 'package:flutter/material.dart';
import 'package:jdr_maker/firebase/firebase_service_firestore.dart';
import 'package:jdr_maker/models/membre_model.dart';
import 'package:jdr_maker/models/projet_model.dart';
import 'package:provider/provider.dart';

/// Classe : Membre
///
/// Type : Controller
///
/// Contient le membre actuel
class MembreController extends ChangeNotifier {
  /// Personnage sélectionné
  MembreModel? membre;

  void _actualiser(MembreModel membre) {
    this.membre = membre;
    notifyListeners();
  }

  static void changerMembre(BuildContext context, MembreModel membre) {
    Provider.of<MembreController>(context, listen: false)._actualiser(membre);
  }

  /// Charger les modèles des membres du [projet] demandé
  static Future<List<MembreModel>> chargerMembresModeles(ProjetModel projet) async {
    List<MembreModel> liste = [];

    await FirebaseServiceFirestore.getListe(MembreModel.nomCollection, (data) {
      MembreModel cible = MembreModel.fromMap(data);
      if (cible.idProjet == projet.id) {
        liste.add(cible);
      }
    });

    liste.sort((a, b) => a.idMembre.compareTo(b.idMembre));

    return liste;
  }
}
