import 'dart:math';

import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

/// Classe : Générateur
///
/// Type : Tool
///
/// Générer différents éléments selon le besoin
class GenerateurTool {
  /// Générer un nombre aléatoire entre 0 et la [valeurMax]
  static int genererNombre(int valeurMax) {
    return 1 + Random().nextInt((valeurMax + 1) - 1);
  }

  /// Générer un ID aléatoire
  static String genererID() {
    return Uuid().v4();
  }

  /// Générer la date actuelle
  static String genererDateActuelle() {
    return DateFormat('dd-MM-yyyy kk:mm').format(DateTime.now());
  }
}
