// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (c) 2026 medlav.app

// repository_3b.dart

import 'package:drift/drift.dart';
import 'package:gestionale_a3/data/database.dart';
import 'package:gestionale_a3/data/config.dart';

class Repository3B {
  final AppDatabase db;

  Repository3B(this.db);

  /// Esegue l'aggregazione dei dati per l'Allegato 3B basata su un'azienda e un anno specifico.
  /// Implementa la logica "Zero-Loss" calcolando tutto in tempo reale dai dati del 3A.
  Future<Map<String, dynamic>> generaDatiAggregati({
    required int aziendaId,
    required int anno,
  }) async {
    // 1. Recupero Dati Identificativi Azienda (Punti 2-8, 9-10)
    final azienda = await (db.select(
      db.aziende,
    )..where((t) => t.id.equals(aziendaId))).getSingle();

    // 2. Recupero tutte le visite dell'anno per l'azienda specifica
    final queryVisite =
        db.select(db.visite).join([
            innerJoin(
              db.lavoratori,
              db.lavoratori.id.equalsExp(db.visite.lavoratoreId),
            ),
          ])
          ..where(db.lavoratori.aziendaId.equals(aziendaId))
          ..where(db.visite.dataVisita.year.equals(anno));

    final risultati = await queryVisite.get();

    // 3. Inizializzazione contatori Sorveglianza Sanitaria (Punti 16-21)
    int visitatiM = 0, visitatiF = 0;
    int idoneiM = 0, idoneiF = 0;
    int parzialiM = 0, parzialiF = 0;
    int inidoneiTempM = 0, inidoneiTempF = 0;
    int inidoneiPermM = 0, inidoneiPermF = 0;

    // 4. Inizializzazione contatori Malattie Professionali (Punti 14-15)
    int malattieSegnalateM = 0;
    int malattieSegnalateF = 0;
    List<String> tipologieMalattie = [];

    // 5. Inizializzazione contatori Alcol e Sostanze (Punti 43-44)
    int alcolTestM = 0, alcolTestF = 0;
    int alcolSertM = 0, alcolSertF = 0;
    int alcolPositiviM = 0, alcolPositiviF = 0;
    int drugTestM = 0, drugTestF = 0;
    int drugSertM = 0, drugSertF = 0;
    int drugPositiviM = 0, drugPositiviF = 0;

    // 6. Inizializzazione Mappa Rischi (Punti 22-42)
    // Struttura: { nomeRischio: { visitatiM: 0, visitatiF: 0, idoneiM: 0, idoneiF: 0, parzialiM: 0, parzialiF: 0 } }
    final rischiKey = [
      'rMmc',
      'rSovraccaricoArti',
      'rPosturali',
      'rChimico',
      'rCancerogeni',
      'rMutageni',
      'rAmianto',
      'rSilice',
      'rBiologico',
      'rVdt',
      'rVibrazioniCorpo',
      'rVibrazioniMano',
      'rRumore',
      'rCampiElettro',
      'rRoa',
      'rUv',
      'rMicroclima',
      'rInfrasuoni',
      'rAtmosfere',
      'rNotturno',
      'rRiproduzione',
    ];

    Map<String, Map<String, int>> statisticaRischi = {
      for (var r in rischiKey)
        r: {'vM': 0, 'vF': 0, 'idM': 0, 'idF': 0, 'pM': 0, 'pF': 0},
    };

    // 7. Loop di elaborazione record
    for (var row in risultati) {
      final v = row.readTable(db.visite);
      final l = row.readTable(db.lavoratori);
      final isM = l.sesso.toUpperCase() == 'M';

      // --- Sorveglianza Sanitaria Generale ---
      if (isM) {
        visitatiM++;
        if (v.giudizioIdoneita == 1) idoneiM++;
        if (v.giudizioIdoneita == 2) parzialiM++;
        if (v.giudizioIdoneita == 3) inidoneiTempM++;
        if (v.giudizioIdoneita == 4) inidoneiPermM++;
        if (v.malattiaProfSegnalata) malattieSegnalateM++;
        if (v.screeningAlcol) alcolTestM++;
        if (v.invioSert && v.screeningAlcol) alcolSertM++;
        if (v.dipendenzaConfermata && v.screeningAlcol) alcolPositiviM++;
        if (v.screeningSostanze) drugTestM++;
        if (v.invioSert && v.screeningSostanze) drugSertM++;
        if (v.dipendenzaConfermata && v.screeningSostanze) drugPositiviM++;
      } else {
        visitatiF++;
        if (v.giudizioIdoneita == 1) idoneiF++;
        if (v.giudizioIdoneita == 2) parzialiF++;
        if (v.giudizioIdoneita == 3) inidoneiTempF++;
        if (v.giudizioIdoneita == 4) inidoneiPermF++;
        if (v.malattiaProfSegnalata) malattieSegnalateF++;
        if (v.screeningAlcol) alcolTestF++;
        if (v.invioSert && v.screeningAlcol) alcolSertF++;
        if (v.dipendenzaConfermata && v.screeningAlcol) alcolPositiviF++;
        if (v.screeningSostanze) drugTestF++;
        if (v.invioSert && v.screeningSostanze) drugSertF++;
        if (v.dipendenzaConfermata && v.screeningSostanze) drugPositiviF++;
      }

      if (v.tipologiaMalattia != null && v.tipologiaMalattia!.isNotEmpty) {
        tipologieMalattie.add(v.tipologiaMalattia!);
      }

      // --- Aggregazione Rischi Specifici ---
      void checkRischio(bool value, String key) {
        if (value) {
          if (isM) {
            statisticaRischi[key]!['vM'] = statisticaRischi[key]!['vM']! + 1;
            if (v.giudizioIdoneita == 1) {
              statisticaRischi[key]!['idM'] =
                  statisticaRischi[key]!['idM']! + 1;
            }
            if (v.giudizioIdoneita == 2) {
              statisticaRischi[key]!['pM'] = statisticaRischi[key]!['pM']! + 1;
            }
          } else {
            statisticaRischi[key]!['vF'] = statisticaRischi[key]!['vF']! + 1;
            if (v.giudizioIdoneita == 1) {
              statisticaRischi[key]!['idF'] =
                  statisticaRischi[key]!['idF']! + 1;
            }
            if (v.giudizioIdoneita == 2) {
              statisticaRischi[key]!['pF'] = statisticaRischi[key]!['pF']! + 1;
            }
          }
        }
      }

      checkRischio(v.rMmc, 'rMmc');
      checkRischio(v.rSovraccaricoArti, 'rSovraccaricoArti');
      checkRischio(v.rPosturali, 'rPosturali');
      checkRischio(v.rChimico, 'rChimico');
      checkRischio(v.rCancerogeni, 'rCancerogeni');
      checkRischio(v.rMutageni, 'rMutageni');
      checkRischio(v.rAmianto, 'rAmianto');
      checkRischio(v.rSilice, 'rSilice');
      checkRischio(v.rBiologico, 'rBiologico');
      checkRischio(v.rVdt, 'rVdt');
      checkRischio(v.rVibrazioniCorpo, 'rVibrazioniCorpo');
      checkRischio(v.rVibrazioniMano, 'rVibrazioniMano');
      checkRischio(v.rRumore, 'rRumore');
      checkRischio(v.rCampiElettro, 'rCampiElettro');
      checkRischio(v.rRoa, 'rRoa');
      checkRischio(v.rUv, 'rUv');
      checkRischio(v.rMicroclima, 'rMicroclima');
      checkRischio(v.rInfrasuoni, 'rInfrasuoni');
      checkRischio(v.rAtmosfere, 'rAtmosfere');
      checkRischio(v.rNotturno, 'rNotturno');
      checkRischio(v.rRiproduzione, 'rRiproduzione');
    }

    return {
      'anno': anno,
      'medico': {
        'cognome': ConfigMedico.cognome,
        'nome': ConfigMedico.nome,
        'cf': ConfigMedico.codiceFiscale,
        'email': ConfigMedico.email,
      },
      'azienda': azienda,
      'malattie': {
        'maschi': malattieSegnalateM,
        'femmine': malattieSegnalateF,
        'tipologie': tipologieMalattie.toSet().toList(),
      },
      'sorveglianza': {
        'visitatiM': visitatiM,
        'visitatiF': visitatiF,
        'idoneiM': idoneiM,
        'idoneiF': idoneiF,
        'parzialiM': parzialiM,
        'parzialiF': parzialiF,
        'tempInidoneiM': inidoneiTempM,
        'tempInidoneiF': inidoneiTempF,
        'permInidoneiM': inidoneiPermM,
        'permInidoneiF': inidoneiPermF,
      },
      'rischi': statisticaRischi,
      'alcol': {
        'testM': alcolTestM,
        'testF': alcolTestF,
        'sertM': alcolSertM,
        'sertF': alcolSertF,
        'posM': alcolPositiviM,
        'posF': alcolPositiviF,
      },
      'sostanze': {
        'testM': drugTestM,
        'testF': drugTestF,
        'sertM': drugSertM,
        'sertF': drugSertF,
        'posM': drugPositiviM,
        'posF': drugPositiviF,
      },
    };
  }
}
