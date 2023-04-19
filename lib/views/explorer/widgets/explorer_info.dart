import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/projet_controller.dart';
import 'package:jdr_maker/models/projet_model.dart';
import 'package:jdr_maker/templates/banniere_info.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';

class ExplorerInfo extends StatefulWidget {
  final List<ProjetModel> projets;
  final ProjetModel? projetActuel;

  ExplorerInfo({
    required this.projets,
    required this.projetActuel,
  });

  @override
  State<ExplorerInfo> createState() => _ExplorerInfoState();
}

class _ExplorerInfoState extends State<ExplorerInfo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.projets.isEmpty) {
      return _afficherInfo("Vous n'avez aucun projet pour le moment", "Nouveau", () {});
    } else if (widget.projetActuel == null) {
      ProjetModel dernierProjet = widget.projets.first;
      return _afficherInfo(
        "Dernier projet modifié : ${dernierProjet.nom}",
        "Sélectionner",
        () => _chargerProjet(dernierProjet),
      );
    }

    return Container();
  }

  Future _chargerProjet(ProjetModel projet) async {
    await ProjetController.charger(context, projet);
    print("done");
  }

  Widget _afficherInfo(String message, String texteBouton, VoidCallback action) {
    return BanniereInfo(
      child: Row(
        children: [
          Text(
            message,
            style: TextStyle(
              color: App.couleurs().texte(),
              fontSize: App.fontSize().normal(),
            ),
          ),
          Spacer(),
          Material(
            color: Colors.transparent,
            child: Bouton(
              onTap: action,
              borderRadius: BorderRadius.circular(5),
              couleurHover: App.couleurs().fondSecondaire().withOpacity(0.3),
              child: Ink(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: App.couleurs().violet(),
                ),
                child: Text(
                  texteBouton,
                  style: TextStyle(
                    color: App.couleurs().important(),
                    fontSize: App.fontSize().normal(),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
