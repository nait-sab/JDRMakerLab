import 'package:flutter/material.dart';
import 'package:jdr_maker/firebase/firebase_service_firestore.dart';
import 'package:jdr_maker/models/lieu_model.dart';
import 'package:jdr_maker/models/projet_model.dart';
import 'package:provider/provider.dart';

/// Classe : Lieu
///
/// Type : Controller
///
/// Contient le lieu actuel
class LieuController extends ChangeNotifier {
  /// Lieu sélectionné
  LieuModel? lieu;

  void _actualiser(LieuModel lieu) {
    this.lieu = lieu;
    notifyListeners();
  }

  static void changerLieu(BuildContext context, LieuModel lieu) {
    Provider.of<LieuController>(context, listen: false)._actualiser(lieu);
  }

  static LieuModel? getLieu(BuildContext context) {
    return Provider.of<LieuController>(context, listen: false).lieu;
  }

  /// Charger les lieux du [projet] demandé
  static Future<List<LieuModel>> chargerLieux(ProjetModel projet) async {
    List<LieuModel> liste = [];

    await FirebaseServiceFirestore.getListe(LieuModel.nomCollection, (data) {
      LieuModel cible = LieuModel.fromMap(data);
      if (cible.idProjet == projet.id) {
        liste.add(cible);
      }
    });

    liste.sort((a, b) => b.dateModification.compareTo(a.dateModification));
    return liste;
  }
}
