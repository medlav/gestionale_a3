// config_medico.dart
class ConfigMedico {
  final String cognome;
  final String nome;
  final String codiceFiscale;
  final String email;
  final String pathFirma;

  ConfigMedico({
    required this.cognome,
    required this.nome,
    required this.codiceFiscale,
    required this.email,
    this.pathFirma = "assets/images/firma.png",
  });

  // Default initial values (replacing your old hardcoded ones)
  factory ConfigMedico.initial() {
    return ConfigMedico(
      cognome: "COGNOME",
      nome: "NOME",
      codiceFiscale: "CFMEDICO12345678",
      email: "medico@competente.it",
    );
  }

  ConfigMedico copyWith({
    String? cognome,
    String? nome,
    String? codiceFiscale,
    String? email,
    String? pathFirma,
  }) {
    return ConfigMedico(
      cognome: cognome ?? this.cognome,
      nome: nome ?? this.nome,
      codiceFiscale: codiceFiscale ?? this.codiceFiscale,
      email: email ?? this.email,
      pathFirma: pathFirma ?? this.pathFirma,
    );
  }
}
