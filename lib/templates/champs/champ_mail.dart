import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';

class ChampMail extends StatefulWidget {
  // Paramètres requis
  final TextEditingController controller;
  final Color couleurFond;
  final Color couleurSaisie;
  final Color couleurPlaceholder;

  // Paramètres optionnel
  final Icon? iconeGauche;
  final Icon? iconeDroite;
  final String? placeholder;
  final InputBorder? enabledBorder;
  final InputBorder? focusBorder;

  ChampMail({
    required this.controller,
    required this.couleurFond,
    required this.couleurSaisie,
    required this.couleurPlaceholder,
    this.iconeGauche,
    this.iconeDroite,
    this.placeholder,
    this.enabledBorder,
    this.focusBorder,
  });

  @override
  State<ChampMail> createState() => _ChampMailState();
}

class _ChampMailState extends State<ChampMail> {
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
        suffixIcon: widget.iconeDroite,
        filled: true,
        fillColor: widget.couleurFond,
      ),
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: widget.couleurSaisie,
        fontSize: App.fontSize().normal(),
      ),
    );
  }
}
