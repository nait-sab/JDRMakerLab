import 'package:flutter/material.dart';
import 'package:jdr_maker/templates/alertes/alerte_copiable.dart';
import 'package:jdr_maker/templates/alertes/alerte_demander.dart';
import 'package:jdr_maker/templates/alertes/alerte_message.dart';

/// Classe : Alerte
///
/// Afficher une alerte général ou personnalisée
class Alerte {
  /// Afficher un message avec un [titre] et un [texte]
  static void message(BuildContext context, String titre, String texte) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlerteMessage(titre: titre, texte: texte);
      },
    );
  }

  static void demander(BuildContext context, String titre, String description, VoidCallback action) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlerteDemander(titre: titre, description: description, action: action);
      },
    );
  }

  /// Afficher un message avec un [titre], un [texte] et un [code] copiable
  static void messageCopiable(BuildContext context, String titre, String texte, String code) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlerteCopiable(titre: titre, texte: texte, code: code);
      },
    );
  }
}
