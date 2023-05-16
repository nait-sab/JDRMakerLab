import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';

class ChampZone extends StatefulWidget {
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

  ChampZone({
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
  State<ChampZone> createState() => _ChampZoneState();
}

class _ChampZoneState extends State<ChampZone> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.multiline,
      maxLines: null,
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
