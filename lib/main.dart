import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:jdr_maker/config/app.dart';
import 'package:jdr_maker/controllers/navigation_controller.dart';
import 'package:jdr_maker/controllers/projet_controller.dart';
import 'package:jdr_maker/controllers/utilisateur_controller.dart';
import 'package:jdr_maker/firebase/firebase_init.dart';
import 'package:provider/provider.dart';

Future main() async {
  // Initialisation des modules
  await dotenv.load();
  await initializeDateFormatting();
  Intl.defaultLocale = "fr_FR";
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseInit.initialiserFirebase();

  runApp(
    MultiProvider(
      providers: [
        // Système
        ListenableProvider<NavigationController>(create: (_) => NavigationController()),
        ListenableProvider<ProjetController>(create: (_) => ProjetController()),
        ListenableProvider<UtilisateurController>(create: (_) => UtilisateurController()),
      ],
      child: App(),
    ),
  );

  // Réglages fenêtre desktop
  if (Platform.isWindows) {
    doWhenWindowReady(() {
      var fenetre = appWindow;
      var tailleInitiale = Size(1280, 720);
      fenetre.minSize = tailleInitiale;
      fenetre.size = tailleInitiale;
      fenetre.alignment = Alignment.center;
      fenetre.title = "Dé part";
      fenetre.show();
    });
  }

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemStatusBarContrastEnforced: true,
      systemNavigationBarColor: App.couleurs().fondSecondaire(),
      systemNavigationBarDividerColor: App.couleurs().fondSecondaire(),
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: [SystemUiOverlay.top],
  );
}
