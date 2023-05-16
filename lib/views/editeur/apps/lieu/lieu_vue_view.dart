import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/interface/app_interface.dart';
import 'package:jdr_maker/templates/boutons/bouton_icone.dart';
import 'package:jdr_maker/views/editeur/apps/widgets/editeur_application_entete.dart';

class LieuVueView extends StatefulWidget {
  @override
  State<LieuVueView> createState() => _LieuVueViewState();
}

class _LieuVueViewState extends State<LieuVueView> {
  @override
  Widget build(BuildContext context) {
    return AppInterface(
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: App.couleurs().fondSecondaire(),
        ),
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            Column(
              children: [
                EditeurApplicationEntete(
                  titre: "Lieux",
                  route: "/editeur/lieu/liste",
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: BoutonIcone(
                action: () {},
                icone: Icons.done_rounded,
              ),
            )
          ],
        ),
      ),
    );
  }
}
