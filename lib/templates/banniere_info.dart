import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';

class BanniereInfo extends StatelessWidget {
  final Widget child;

  BanniereInfo({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: App.couleurs().fondSecondaire(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
