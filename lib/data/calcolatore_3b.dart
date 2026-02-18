// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (c) 2026 medlav.app

// calcolatore_3b.dart

import 'database.dart';

class Calcolatore3B {
  /// Calcola la media annuale dei lavoratori occupati (Punto 10 Allegato 3B)
  /// Formula: (Totale lavoratori al 30/06 + Totale lavoratori al 31/12) / 2
  static double calcolaMediaAnnuale({
    required int m3006,
    required int f3006,
    required int m3112,
    required int f3112,
  }) {
    int totaleGiugno = m3006 + f3006;
    int totaleDicembre = m3112 + f3112;
    return (totaleGiugno + totaleDicembre) / 2.0;
  }

  /// Restituisce la descrizione testuale del giudizio di idoneità
  /// basata sui codici standard utilizzati per l'aggregazione 3B.
  static String getDescrizioneGiudizio(int codice) {
    switch (codice) {
      case 1:
        return "Idoneità totale alla mansione";
      case 2:
        return "Idoneità parziale (prescrizioni/limitazioni)";
      case 3:
        return "Inidoneità temporanea";
      case 4:
        return "Inidoneità permanente";
      default:
        return "Giudizio non espresso";
    }
  }

  /// Verifica se una visita rientra nei criteri per la segnalazione
  /// di malattia professionale ex art. 139 DPR 1124/65 (Punto 14-15)
  static bool isMalattiaProfessionale(Visita visita) {
    return visita.malattiaProfSegnalata;
  }

  /// Calcola la percentuale di lavoratori visitati rispetto ai soggetti a sorveglianza
  static double calcolaPercentualeCopertura({
    required int totaliSoggetti,
    required int totaliVisitati,
  }) {
    if (totaliSoggetti == 0) return 0.0;
    return (totaliVisitati / totaliSoggetti) * 100;
  }

  /// Valida se i dati di un'azienda sono completi per l'invio 3B
  static bool validaDatiAzienda(Azienda azienda) {
    return azienda.ragioneSociale.isNotEmpty &&
        azienda.partitaIvaCf.isNotEmpty &&
        azienda.codiceAteco.isNotEmpty;
  }
}
