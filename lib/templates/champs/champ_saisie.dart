import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';

class ChampSaisie extends StatefulWidget {
  // Paramètres requis
  final TextEditingController controller;
  final Color couleurFond;
  final Color couleurSaisie;
  final Color couleurPlaceholder;

  /// Bordure (OutlineInputBorder défaut)
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusBorder;

  // Paramètres optionnel
  final Icon? iconeGauche;
  final Icon? iconeDroite;
  final String? placeholder;

  ChampSaisie({
    required this.controller,
    required this.couleurFond,
    required this.couleurSaisie,
    required this.couleurPlaceholder,
    this.iconeGauche,
    this.iconeDroite,
    this.placeholder,
    this.enabledBorder,
    this.focusBorder,
    InputBorder? border,
  }) : border = border ?? OutlineInputBorder();

  @override
  State<ChampSaisie> createState() => _ChampSaisieState();
}

class _ChampSaisieState extends State<ChampSaisie> {
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
        border: widget.border,
        enabledBorder: widget.enabledBorder,
        focusedBorder: widget.focusBorder,
        prefixIcon: widget.iconeGauche,
        suffixIcon: widget.iconeDroite,
        filled: true,
        fillColor: widget.couleurFond,
        hoverColor: App.couleurs().fondSecondaire().withOpacity(0.3),
      ),
      style: TextStyle(
        color: widget.couleurSaisie,
        fontSize: App.fontSize().normal(),
      ),
    );
  }
}
