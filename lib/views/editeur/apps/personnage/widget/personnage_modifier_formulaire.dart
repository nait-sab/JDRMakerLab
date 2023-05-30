import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/models/personnage_model.dart';
import 'package:jdr_maker/templates/boutons/bouton_icone.dart';
import 'package:jdr_maker/templates/champs/champ_saisie.dart';
import 'package:jdr_maker/templates/champs/champ_zone.dart';
import 'package:jdr_maker/views/editeur/apps/personnage/widget/personnage_image.dart';
import 'package:jdr_maker/views/editeur/apps/widgets/editeur_application_entete.dart';

class PersonnageModifierFormulaire extends StatefulWidget {
  final PersonnageModel personnage;
  final Function modifier;

  PersonnageModifierFormulaire({
    required this.personnage,
    required this.modifier,
  });

  @override
  State<PersonnageModifierFormulaire> createState() => _PersonnageModifierFormulaireState();
}

class _PersonnageModifierFormulaireState extends State<PersonnageModifierFormulaire> {
  late TextEditingController nom;
  late TextEditingController occupation;
  late TextEditingController age;
  late TextEditingController taille;
  late TextEditingController poids;
  late TextEditingController description;
  late TextEditingController histoire;
  late String urlIcone;
  late String urlImage;

  @override
  void initState() {
    super.initState();
    nom = TextEditingController(text: widget.personnage.nom);
    occupation = TextEditingController(text: widget.personnage.occupation);
    age = TextEditingController(text: widget.personnage.age);
    taille = TextEditingController(text: widget.personnage.taille);
    poids = TextEditingController(text: widget.personnage.poids);
    description = TextEditingController(text: widget.personnage.description);
    histoire = TextEditingController(text: widget.personnage.histoire);
    urlIcone = widget.personnage.urlIcone;
    urlImage = widget.personnage.urlImage;
    nom.addListener(() => setState(() {}));
  }

  void changerIcone(String urlIcone) => setState(() => this.urlIcone = urlIcone);
  void changerImage(String urlImage) => setState(() => this.urlImage = urlImage);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            EditeurApplicationEntete(
              titre: "Modifier le personnage : ${widget.personnage.nom}",
              route: "/editeur/personnage/vue",
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
                          child: PersonnageImage(
                            modifiable: true,
                            isIcone: true,
                            urlIcone: urlIcone,
                            changerIcone: changerIcone,
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 430,
                          width: 180,
                          child: PersonnageImage(
                            modifiable: true,
                            isIcone: false,
                            urlIcone: urlImage,
                            changerIcone: changerImage,
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Occupation",
                                style: TextStyle(
                                  color: App.couleurs().important(),
                                  fontSize: App.fontSize().normal(),
                                ),
                              ),
                              SizedBox(height: 5),
                              ChampZone(
                                controller: occupation,
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
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Age",
                                          style: TextStyle(
                                            color: App.couleurs().important(),
                                            fontSize: App.fontSize().normal(),
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        ChampZone(
                                          controller: age,
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
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Taille",
                                          style: TextStyle(
                                            color: App.couleurs().important(),
                                            fontSize: App.fontSize().normal(),
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        ChampZone(
                                          controller: taille,
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
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Poids",
                                          style: TextStyle(
                                            color: App.couleurs().important(),
                                            fontSize: App.fontSize().normal(),
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        ChampZone(
                                          controller: poids,
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
                                        )
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
                              SizedBox(height: 20),
                              Text(
                                "Histoire",
                                style: TextStyle(
                                  color: App.couleurs().important(),
                                  fontSize: App.fontSize().normal(),
                                ),
                              ),
                              SizedBox(height: 5),
                              ChampZone(
                                controller: histoire,
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
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: BoutonIcone(
            action: () => NavigationController.changerView(context, "/editeur/personnage/vue"),
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
        action: () => widget.modifier(
          nom.text,
          occupation.text,
          age.text,
          taille.text,
          poids.text,
          description.text,
          histoire.text,
          urlIcone,
          urlImage,
        ),
        icone: Icons.done_rounded,
      ),
    );
  }
}
