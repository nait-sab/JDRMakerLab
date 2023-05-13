import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';

class AlerteMessageCopiable extends StatelessWidget {
  final String titre;
  final String texte;
  final String code;

  AlerteMessageCopiable({
    required this.titre,
    required this.texte,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width * (Platform.isAndroid ? double.infinity : 0.5),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: App.couleurs().fondSecondaire(),
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titre,
                style: TextStyle(
                  fontSize: App.fontSize().sousTitre(),
                  fontWeight: FontWeight.bold,
                  color: App.couleurs().important(),
                ),
              ),
              SizedBox(height: 20),
              Text(
                texte + code,
                style: TextStyle(
                  fontSize: App.fontSize().normal(),
                  color: App.couleurs().texte(),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Bouton(
                    onTap: () => Navigator.of(context, rootNavigator: true).pop(),
                    child: Text(
                      "Annuler",
                      style: TextStyle(
                        fontSize: App.fontSize().normal(),
                        color: App.couleurs().important(),
                      ),
                    ),
                  ),
                  Spacer(),
                  Bouton(
                    onTap: () async {
                      Navigator.of(context, rootNavigator: true).pop();
                      await Clipboard.setData(ClipboardData(text: code));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: App.couleurs().violet(),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "Copier",
                        style: TextStyle(
                          fontSize: App.fontSize().normal(),
                          color: App.couleurs().important(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
