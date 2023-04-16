import 'dart:io';

/// Polices de l'application
class Polices {
  /// Taille de police des fonts (16 / 18)
  double normal() => Platform.isAndroid ? 16 : 18;

  /// Taille de police des fonts Chargement (40)
  double titre() => 40;

  /// Taille de police des fonts Chargement (30)
  double sousTitre() => 30;

  /// Taille de police des fonts Chargement (30)
  double icone() => 30;

  /// Taille de police des fonts Chargement (26)
  double chargement() => 26;
}
