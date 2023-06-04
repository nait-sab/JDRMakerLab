import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/models/objet_model.dart';
import 'package:jdr_maker/templates/boutons/bouton_icone.dart';
import 'package:jdr_maker/templates/champs/champ_saisie.dart';
import 'package:jdr_maker/templates/champs/champ_zone.dart';
import 'package:jdr_maker/views/editeur/apps/objet/widgets/objet_image.dart';
import 'package:jdr_maker/views/editeur/apps/widgets/editeur_application_entete.dart';

class ObjetModifierFormulaire extends StatefulWidget {
  final ObjetModel objet;
  final Function modifier;

  ObjetModifierFormulaire({
    required this.objet,
    required this.modifier,
  });

  @override
  State<ObjetModifierFormulaire> createState() => _ObjetModifierFormulaireState();
}

class _ObjetModifierFormulaireState extends State<ObjetModifierFormulaire> {
  late TextEditingController nom;
  late TextEditingController description;
  late String urlImage;

  @override
  void initState() {
    super.initState();
    nom = TextEditingController(text: widget.objet.nom);
    description = TextEditingController(text: widget.objet.description);
    urlImage = widget.objet.urlImage;
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
              titre: "Modifier l'objet : ${widget.objet.nom}",
              route: "/editeur/objet/vue",
            ),
            SizedBox(height: 20),
            Expanded(
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
                            modifiable: true,
                            urlIcone: urlImage,
                            changerImage: changerImage,
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
                            ],
                          ),
                        ),
                      ],
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
            action: () => NavigationController.changerView(context, "/editeur/objet/vue"),
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
