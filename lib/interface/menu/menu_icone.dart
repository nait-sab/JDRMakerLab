import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/templates/boutons/bouton.dart';

class MenuIcone extends StatelessWidget {
  final IconData icone;

  MenuIcone({
    required this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: Bouton(
          onTap: () {},
          child: Ink(
            width: 75,
            child: Center(
              child: Icon(
                icone,
                color: Colors.white,
                size: App.fontSize().titre(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
