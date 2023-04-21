import 'package:flutter/material.dart';
import 'package:jdr_maker/controllers/projet_controller.dart';
import 'package:jdr_maker/interface/app_interface.dart';
import 'package:jdr_maker/models/personnage_model.dart';

class PersonnageListeView extends StatefulWidget {
  @override
  State<PersonnageListeView> createState() => _PersonnageListeViewState();
}

class _PersonnageListeViewState extends State<PersonnageListeView> {
  late List<PersonnageModel> personnages;

  @override
  void initState() {
    super.initState();
    personnages = ProjetController.getPersonnages(context);
  }

  @override
  Widget build(BuildContext context) {
    return AppInterface(
      child: Container(
        height: double.infinity,
        margin: EdgeInsets.all(20),
        child: Stack(
          children: [
            Column(
              children: [
                // Entête
                // Header de liste
                // liste
              ],
              // Bouton Ajouter
            ),
          ],
        ),
      ),
    );
  }
}
