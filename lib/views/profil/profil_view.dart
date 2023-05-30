import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/projet_controller.dart';
import 'package:jdr_maker/controllers/utilisateur_controller.dart';
import 'package:jdr_maker/interface/app_interface.dart';
import 'package:jdr_maker/models/projet_model.dart';
import 'package:jdr_maker/models/utilisateur_model.dart';
import 'package:jdr_maker/views/profil/widgets/profil_info.dart';
import 'package:jdr_maker/views/profil/widgets/profil_parametres.dart';
import 'package:jdr_maker/views/profil/widgets/profil_score.dart';

class ProfilView extends StatefulWidget {
  final String onglet;

  ProfilView({
    required this.onglet,
  });

  @override
  State<ProfilView> createState() => _ProfilViewState();
}

class _ProfilViewState extends State<ProfilView> {
  late UtilisateurModel utilisateur;
  late int projetsTotal;

  @override
  void initState() {
    super.initState();
    utilisateur = UtilisateurController.getUtilisateur(context)!;

    // Calculer le nombre de projets personnel
    List<ProjetModel> projets = [];
    for (ProjetModel projet in ProjetController.getProjets(context)) {
      if (projet.idCreateur == utilisateur.id) {
        projets.add(projet);
      }
    }
    projetsTotal = projets.length;
  }

  @override
  Widget build(BuildContext context) {
    return AppInterface(
      child: Container(
        height: double.infinity,
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfilInfo(utilisateur: utilisateur),
              SizedBox(height: 20),
              StaggeredGrid.count(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  ProfilScore(
                    nom: "Projets",
                    icone: Icons.token_rounded,
                    iconeCouleur: App.couleurs().bleu(),
                    total: projetsTotal,
                  ),
                  ProfilScore(
                    nom: "Parties jouées",
                    icone: Icons.play_arrow_rounded,
                    iconeCouleur: App.couleurs().vert(),
                    total: 0,
                  ),
                  ProfilScore(
                    nom: "Projets aimés",
                    icone: Icons.favorite_rounded,
                    iconeCouleur: App.couleurs().rouge(),
                    total: 0,
                  ),
                ],
              ),
              SizedBox(height: 20),
              ProfilParametres(onglet: widget.onglet),
            ],
          ),
        ),
      ),
    );
  }
}
