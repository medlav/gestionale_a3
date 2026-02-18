// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (c) 2026 medlav.app

// database.dart
import 'package:drift/drift.dart';

part 'database.g.dart';

// --- TABELLA AZIENDE (Allegato 3A & 3B) ---
@DataClassName('Azienda')
class Aziende extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get ragioneSociale => text()();
  TextColumn get partitaIvaCf => text()();
  TextColumn get codiceFiscaleSocieta => text()();
  TextColumn get indirizzoSedeLegale => text()();
  TextColumn get denominazioneUnitaProduttiva => text()();
  TextColumn get indirizzoUnitaProduttiva => text()();
  TextColumn get codiceAteco => text()();

  // Dati occupazionali aggregati (3B)
  IntColumn get occupati3006Maschi =>
      integer().withDefault(const Constant(0))();
  IntColumn get occupati3006Femmine =>
      integer().withDefault(const Constant(0))();
  IntColumn get occupati3112Maschi =>
      integer().withDefault(const Constant(0))();
  IntColumn get occupati3112Femmine =>
      integer().withDefault(const Constant(0))();
}

// --- TABELLA LAVORATORI (Anagrafica 3A) ---
@DataClassName('Lavoratore')
class Lavoratori extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get aziendaId => integer().references(Aziende, #id)();
  TextColumn get cognome => text()();
  TextColumn get nome => text()();
  TextColumn get sesso => text().withLength(min: 1, max: 1)();
  TextColumn get luogoNascita => text()();
  DateTimeColumn get dataNascita => dateTime()();
  TextColumn get domicilioComune => text()();
  TextColumn get domicilioProvincia => text()();
  TextColumn get domicilioIndirizzo => text()();
  TextColumn get domicilioTelefono => text()();
  TextColumn get nazionalita => text()();
  TextColumn get codiceFiscale => text().withLength(min: 16, max: 16)();
}

// --- TABELLA VISITE (Dati Clinici 3A e Aggregazione 3B) ---
@DataClassName('Visita')
class Visite extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get lavoratoreId => integer().references(Lavoratori, #id)();
  DateTimeColumn get dataVisita => dateTime()();
  IntColumn get tipoVisita => integer()();

  // ALLEGATO 3A
  TextColumn get reparto => text().nullable()();
  TextColumn get mansioneSpecifica => text()();
  TextColumn get fattoriRischio3A => text()();
  TextColumn get anamnesiLavorativa => text()();
  TextColumn get anamnesiFamiliare => text()();
  TextColumn get anamnesiFisiologica => text()();
  TextColumn get anamnesiPatologicaRemota => text()();
  TextColumn get anamnesiPatologicaProssima => text()();
  TextColumn get esameObiettivo => text()();
  TextColumn get accertamentiIntegrativi => text()();
  TextColumn get provvedimentiMedico => text().nullable()();

  // Giudizio e Trasmissione
  IntColumn get giudizioIdoneita => integer()();
  DateTimeColumn get scadenzaVisitaSuccessiva => dateTime().nullable()();
  DateTimeColumn get dataTrasmissioneLavoratore => dateTime().nullable()();
  DateTimeColumn get dataTrasmissioneDatore => dateTime().nullable()();

  // ALLEGATO 3B - Malattie Professionali
  BoolColumn get malattiaProfSegnalata =>
      boolean().withDefault(const Constant(false))();
  TextColumn get tipologiaMalattia => text().nullable()();

  // ALLEGATO 3B - Rischi per Aggregazione
  BoolColumn get rMmc => boolean().withDefault(const Constant(false))();
  BoolColumn get rSovraccaricoArti =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get rPosturali => boolean().withDefault(const Constant(false))();
  BoolColumn get rChimico => boolean().withDefault(const Constant(false))();
  BoolColumn get rCancerogeni => boolean().withDefault(const Constant(false))();
  BoolColumn get rMutageni => boolean().withDefault(const Constant(false))();
  BoolColumn get rAmianto => boolean().withDefault(const Constant(false))();
  BoolColumn get rSilice => boolean().withDefault(const Constant(false))();
  BoolColumn get rBiologico => boolean().withDefault(const Constant(false))();
  BoolColumn get rVdt => boolean().withDefault(const Constant(false))();
  BoolColumn get rVibrazioniCorpo =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get rVibrazioniMano =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get rRumore => boolean().withDefault(const Constant(false))();
  BoolColumn get rCampiElettro =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get rRoa => boolean().withDefault(const Constant(false))();
  BoolColumn get rUv => boolean().withDefault(const Constant(false))();
  BoolColumn get rMicroclima => boolean().withDefault(const Constant(false))();
  BoolColumn get rInfrasuoni => boolean().withDefault(const Constant(false))();
  BoolColumn get rAtmosfere => boolean().withDefault(const Constant(false))();
  BoolColumn get rNotturno => boolean().withDefault(const Constant(false))();
  BoolColumn get rRiproduzione =>
      boolean().withDefault(const Constant(false))();
  TextColumn get rAltriRischi => text().nullable()();

  // ALLEGATO 3B - Alcol e Sostanze
  BoolColumn get screeningAlcol =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get screeningSostanze =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get invioSert => boolean().withDefault(const Constant(false))();
  BoolColumn get dipendenzaConfermata =>
      boolean().withDefault(const Constant(false))();
}

@DriftDatabase(tables: [Aziende, Lavoratori, Visite])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);
  @override
  int get schemaVersion => 1;
  Stream<Azienda> getAziendaById(int id) =>
      (select(aziende)..where((t) => t.id.equals(id))).watchSingle();

  Stream<List<Visita>> watchVisiteLavoratore(int lavoratoreId) {
    return (select(visite)
          ..where((t) => t.lavoratoreId.equals(lavoratoreId))
          ..orderBy([(t) => OrderingTerm.desc(t.dataVisita)]))
        .watch();
  }
}
