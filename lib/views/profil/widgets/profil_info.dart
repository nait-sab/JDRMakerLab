import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/models/utilisateur_model.dart';
import 'package:jdr_maker/views/profil/widgets/profil_photo.dart';

class ProfilInfo extends StatefulWidget {
  final UtilisateurModel utilisateur;

  ProfilInfo({
    required this.utilisateur,
  });

  @override
  State<ProfilInfo> createState() => _ProfilInfoState();
}

class _ProfilInfoState extends State<ProfilInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: App.couleurs().fondSecondaire(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  height: 150,
                  width: 180,
                  child: ProfilPhoto(utilisateur: widget.utilisateur),
                ),
                Spacer(),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.utilisateur.username,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: App.fontSize().normal(),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  widget.utilisateur.mail,
                  style: TextStyle(
                    color: App.couleurs().texte(),
                    fontSize: App.fontSize().normal(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
