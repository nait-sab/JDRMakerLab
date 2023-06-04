import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/models/lieu_model.dart';
import 'package:jdr_maker/views/editeur/apps/lieu/widget/lieu_image.dart';

class LieuVueContenu extends StatelessWidget {
  final LieuModel lieu;

  LieuVueContenu({
    required this.lieu,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
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
              lieu.nom,
              style: TextStyle(
                color: App.couleurs().texte(),
                fontSize: App.fontSize().normal(),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: LieuImage(
                modifiable: false,
                urlIcone: lieu.urlImage,
              ),
            ),
            SizedBox(height: 20),
            blocDescription(),
          ],
        ),
      ),
    );
  }

  Widget blocDescription() {
    if (lieu.description.isEmpty) {
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
          lieu.description,
          style: TextStyle(
            color: App.couleurs().texte(),
            fontSize: App.fontSize().normal(),
          ),
        ),
      ],
    );
  }
}
