import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/templates/boutons/bouton_icone.dart';
import 'package:jdr_maker/templates/champs/champ_saisie.dart';
import 'package:jdr_maker/templates/champs/champ_zone.dart';
import 'package:jdr_maker/views/editeur/apps/widgets/editeur_application_entete.dart';

class PersonnageAjouterFormulaire extends StatefulWidget {
  final Function creer;

  PersonnageAjouterFormulaire({
    required this.creer,
  });

  @override
  State<PersonnageAjouterFormulaire> createState() => _PersonnageAjouterFormulaireState();
}

class _PersonnageAjouterFormulaireState extends State<PersonnageAjouterFormulaire> {
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
    nom = TextEditingController();
    occupation = TextEditingController();
    age = TextEditingController();
    taille = TextEditingController();
    poids = TextEditingController();
    description = TextEditingController();
    histoire = TextEditingController();
    urlIcone = urlImage = "";
    nom.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            EditeurApplicationEntete(
              titre: "Nouveau Personnage",
              route: "/editeur/personnage/liste",
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
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
        boutonAjouter(),
      ],
    );
  }

  Widget boutonAjouter() {
    if (nom.text.isEmpty) {
      return Container();
    }

    return Align(
      alignment: Alignment.bottomRight,
      child: BoutonIcone(
        action: () => widget.creer(
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
