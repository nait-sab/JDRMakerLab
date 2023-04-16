import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';

/// Classe : Champ Mot de passe
///
/// Contient un bouton droit pour afficher ou cacher le mot de passe saisie
class ChampPasse extends StatefulWidget {
  // Paramètres requis
  final TextEditingController controller;
  final Color couleurFond;
  final Color couleurSaisie;
  final Color couleurPlaceholder;

  // Paramètres optionnel
  final Icon? iconeGauche;
  final String? placeholder;
  final InputBorder? enabledBorder;
  final InputBorder? focusBorder;

  ChampPasse({
    required this.controller,
    required this.couleurFond,
    required this.couleurSaisie,
    required this.couleurPlaceholder,
    this.iconeGauche,
    this.placeholder,
    this.enabledBorder,
    this.focusBorder,
  });

  @override
  State<ChampPasse> createState() => _ChampPasseState();
}

class _ChampPasseState extends State<ChampPasse> {
  late bool visible;

  @override
  void initState() {
    super.initState();
    visible = true;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.placeholder,
        hintStyle: TextStyle(
          color: widget.couleurPlaceholder,
          fontSize: App.fontSize().normal(),
        ),
        enabledBorder: widget.enabledBorder,
        focusedBorder: widget.focusBorder,
        prefixIcon: widget.iconeGauche,
        suffixIcon: IconButton(
          icon: _definirIcone(),
          splashColor: Colors.transparent,
          color: App.couleurs().texte(),
          onPressed: () {
            setState(() {
              visible = !visible;
            });
          },
        ),
        filled: true,
        fillColor: widget.couleurFond,
      ),
      style: TextStyle(
        color: widget.couleurSaisie,
        fontSize: App.fontSize().normal(),
      ),
      obscureText: visible,
    );
  }

  Icon _definirIcone() {
    return visible ? Icon(Icons.visibility_off_rounded) : Icon(Icons.visibility_rounded);
  }
}
