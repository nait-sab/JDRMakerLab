import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/models/utilisateur_model.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';

class ProfilInterface extends StatelessWidget {
  final UtilisateurModel utilisateur;

  ProfilInterface({
    required this.utilisateur,
  });

  @override
  Widget build(BuildContext context) {
    return Bouton(
      onTap: () => NavigationController.changerView(context, "/profil/compte"),
      borderRadius: BorderRadius.circular(50),
      child: Ink(
        width: 200,
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Image.network(
                utilisateur.imageUrl,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            SizedBox(width: 10),
            Flexible(
              child: Text(
                utilisateur.username,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: App.couleurs().important(),
                  fontSize: App.fontSize().normal(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
