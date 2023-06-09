import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/models/lieu_model.dart';
import 'package:jdr_maker/templates/boutons/bouton_icone.dart';
import 'package:jdr_maker/templates/champs/champ_saisie.dart';
import 'package:jdr_maker/templates/champs/champ_zone.dart';
import 'package:jdr_maker/views/editeur/apps/lieu/widget/lieu_image.dart';
import 'package:jdr_maker/views/editeur/apps/widgets/editeur_application_entete.dart';

class LieuModifierFormulaire extends StatefulWidget {
  final LieuModel lieu;
  final Function modifier;

  LieuModifierFormulaire({
    required this.lieu,
    required this.modifier,
  });

  @override
  State<LieuModifierFormulaire> createState() => _LieuModifierFormulaireState();
}

class _LieuModifierFormulaireState extends State<LieuModifierFormulaire> {
  late TextEditingController nom;
  late TextEditingController description;
  late String urlImage;

  @override
  void initState() {
    super.initState();
    nom = TextEditingController(text: widget.lieu.nom);
    description = TextEditingController(text: widget.lieu.description);
    urlImage = widget.lieu.urlImage;
    nom.addListener(() => setState(() {}));
  }

  void changerImage(String urlImage) => setState(() => this.urlImage = urlImage);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            EditeurApplicationEntete(
              titre: "Modifier le lieu : ${widget.lieu.nom}",
              route: "/editeur/lieu/vue",
            ),
            SizedBox(height: 20),
            Expanded(
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
                    ChampSaisie(
                      controller: nom,
                      couleurFond: App.couleurs().fondPrincipale(),
                      couleurSaisie: App.couleurs().texte(),
                      couleurPlaceholder: App.couleurs().texte(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: App.couleurs().texte(),
                          width: 3,
                        ),
                      ),
                      focusBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: App.couleurs().violet(),
                          width: 3,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: LieuImage(
                        modifiable: true,
                        urlIcone: urlImage,
                        changerImage: changerImage,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Description",
                      style: TextStyle(
                        color: App.couleurs().important(),
                        fontSize: App.fontSize().normal(),
                      ),
                    ),
                    SizedBox(height: 5),
                    ChampZone(
                      controller: description,
                      couleurFond: App.couleurs().fondPrincipale(),
                      couleurSaisie: App.couleurs().texte(),
                      couleurPlaceholder: App.couleurs().texte(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: App.couleurs().texte(),
                          width: 3,
                        ),
                      ),
                      focusBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: App.couleurs().violet(),
                          width: 3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: BoutonIcone(
            action: () => NavigationController.changerView(context, "/editeur/lieu/vue"),
            icone: Icons.close_rounded,
            couleur: App.couleurs().rouge(),
          ),
        ),
        boutonConfirmer(),
      ],
    );
  }

  Widget boutonConfirmer() {
    if (nom.text.isEmpty) {
      return Container();
    }

    return Align(
      alignment: Alignment.bottomRight,
      child: BoutonIcone(
        action: () => widget.modifier(nom.text, description.text, urlImage),
        icone: Icons.done_rounded,
      ),
    );
  }
}
