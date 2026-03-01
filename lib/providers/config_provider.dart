import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gestionale_a3/data/config.dart';

class ConfigProvider extends ChangeNotifier {
  // --- SINGLETON ACCESSOR ---
  static ConfigProvider? _instance;
  static ConfigProvider get instance {
    if (_instance == null) {
      throw Exception("ConfigProvider non inizializzato!");
    }
    return _instance!;
  }

  late ConfigMedico _medico;
  bool _initialized = false;

  ConfigMedico get medico => _medico;
  bool get initialized => _initialized;

  ConfigProvider() {
    _medico = ConfigMedico.initial();
    _instance = this; // Salva l'istanza per l'accesso globale
    _loadFromPrefs();
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _medico = ConfigMedico(
      nome: prefs.getString('m_nome') ?? _medico.nome,
      cognome: prefs.getString('m_cognome') ?? _medico.cognome,
      codiceFiscale: prefs.getString('m_cf') ?? _medico.codiceFiscale,
      email: prefs.getString('m_email') ?? _medico.email,
    );
    _initialized = true;
    notifyListeners();
  }

  Future<void> updateMedico(ConfigMedico newConfig) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('m_nome', newConfig.nome);
    await prefs.setString('m_cognome', newConfig.cognome);
    await prefs.setString('m_cf', newConfig.codiceFiscale);
    await prefs.setString('m_email', newConfig.email);

    _medico = newConfig;
    notifyListeners();
  }
}
