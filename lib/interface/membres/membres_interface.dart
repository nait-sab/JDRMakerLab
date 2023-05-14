import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/projet_controller.dart';
import 'package:jdr_maker/interface/membres/membre_ajout.dart';
import 'package:jdr_maker/interface/membres/membre_bouton.dart';
import 'package:jdr_maker/models/membre_model.dart';
import 'package:jdr_maker/models/utilisateur_model.dart';

class MembresInterface extends StatefulWidget {
  @override
  State<MembresInterface> createState() => _MembresInterfaceState();
}

class _MembresInterfaceState extends State<MembresInterface> {
  late List<MembreModel> membresModeles;
  late List<UtilisateurModel> membres;

  @override
  void initState() {
    super.initState();
    membresModeles = ProjetController.getMembreModeles(context);
    membres = ProjetController.getMembres(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10),
      color: App.couleurs().fondSecondaire(),
      child: SingleChildScrollView(
        child: Column(
          children: _getListe(),
        ),
      ),
    );
  }

  List<Widget> _getListe() {
    List<Widget> liste = [];
    liste.add(MembreAjout());

    for (UtilisateurModel utilisateur in membres) {
      liste.add(SizedBox(height: 10));
      liste.add(MembreBouton(utilisateur: utilisateur));
    }

    return liste;
  }
}
