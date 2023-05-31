import 'package:flutter/material.dart';
import 'package:jdr_maker/firebase/firebase_service_firestore.dart';
import 'package:jdr_maker/models/objet_model.dart';
import 'package:jdr_maker/models/projet_model.dart';
import 'package:provider/provider.dart';

/// Classe : Objet
///
/// Type : Controller
///
/// Contient l'objet actuel
class ObjetController extends ChangeNotifier {
  /// Événement sélectionné
  ObjetModel? objet;

  void _actualiser(ObjetModel objet) {
    this.objet = objet;
    notifyListeners();
  }

  static void changerObjet(BuildContext context, ObjetModel objet) {
    Provider.of<ObjetController>(context, listen: false)._actualiser(objet);
  }

  static ObjetModel? getObjet(BuildContext context) {
    return Provider.of<ObjetController>(context, listen: false).objet;
  }

  /// Charger les objets du [projet] demandé
  static Future<List<ObjetModel>> chargerObjets(ProjetModel projet) async {
    List<ObjetModel> liste = [];

    await FirebaseServiceFirestore.getListe(ObjetModel.nomCollection, (data) {
      ObjetModel cible = ObjetModel.fromMap(data);
      if (cible.idProjet == projet.id) {
        liste.add(cible);
      }
    });

    liste.sort((a, b) => b.dateModification.compareTo(a.dateModification));
    return liste;
  }
}
