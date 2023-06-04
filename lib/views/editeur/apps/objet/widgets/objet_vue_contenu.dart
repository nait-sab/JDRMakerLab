import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/models/objet_model.dart';
import 'package:jdr_maker/views/editeur/apps/objet/widgets/objet_image.dart';

class ObjetVueContenu extends StatelessWidget {
  final ObjetModel objet;

  ObjetVueContenu({
    required this.objet,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150,
                  width: 180,
                  child: ObjetImage(
                    modifiable: false,
                    urlIcone: objet.urlImage,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nom",
                        style: TextStyle(
                          color: App.couleurs().important(),
                          fontSize: App.fontSize().normal(),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        objet.nom,
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
            blocDescription(),
          ],
        ),
      ),
    );
  }

  Widget blocDescription() {
    if (objet.description.isEmpty) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          "Description",
          style: TextStyle(
            color: App.couleurs().important(),
            fontSize: App.fontSize().normal(),
          ),
        ),
        SizedBox(height: 5),
        Text(
          objet.description,
          style: TextStyle(
            color: App.couleurs().texte(),
            fontSize: App.fontSize().normal(),
          ),
        ),
      ],
    );
  }
}
