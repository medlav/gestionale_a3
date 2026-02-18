// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (c) 2026 medlav.app

import 'package:drift/drift.dart' show OrderingTerm;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gestionale_a3/data/database.dart'
    show AppDatabase, Lavoratore, Azienda, Visita;
import 'package:gestionale_a3/views/widgets/my_appbar.dart' show CustomAppBar;
import 'package:gestionale_a3/views/visita_form.dart' show VisitaForm;

class View3A extends StatelessWidget {
  final int lavoratoreId;

  const View3A({super.key, required this.lavoratoreId});

  static const Map<int, String> mappaGiudizi = {
    1: 'Idoneo',
    2: 'Idoneo con prescrizioni',
    3: 'Inidoneo temporaneo',
    4: 'Inidoneo permanente',
  };

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    final colorScheme = Theme.of(context).colorScheme;

    return StreamBuilder<Lavoratore>(
      stream: (database.select(
        database.lavoratori,
      )..where((t) => t.id.equals(lavoratoreId))).watchSingle(),
      builder: (context, snapshotLavoratore) {
        if (!snapshotLavoratore.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final lavoratore = snapshotLavoratore.data!;

        return Scaffold(
          appBar: CustomAppBar(
            title:
                'CARTELLA: ${lavoratore.cognome.toUpperCase()} ${lavoratore.nome.toUpperCase()}',
          ),
          body: StreamBuilder<Azienda>(
            stream: database.getAziendaById(lavoratore.aziendaId),
            builder: (context, snapshotAzienda) {
              final azienda = snapshotAzienda.data;

              return StreamBuilder<List<Visita>>(
                stream:
                    (database.select(database.visite)
                          ..where((t) => t.lavoratoreId.equals(lavoratore.id))
                          ..orderBy([(t) => OrderingTerm.desc(t.dataVisita)]))
                        .watch(),
                builder: (context, snapshotVisite) {
                  final visite = snapshotVisite.data ?? [];

                  return LayoutBuilder(
                    builder: (context, constraints) {
                      final bool isDesktop = constraints.maxWidth > 900;

                      return SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (isDesktop)
                              IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: _buildBoxInfo(
                                        context,
                                        "ANAGRAFICA LAVORATORE",
                                        _datiLavoratore(lavoratore),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: _buildBoxInfo(
                                        context,
                                        "DATI AZIENDALI",
                                        _datiAzienda(azienda),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            else ...[
                              _buildBoxInfo(
                                context,
                                "ANAGRAFICA LAVORATORE",
                                _datiLavoratore(lavoratore),
                              ),
                              const SizedBox(height: 16),
                              _buildBoxInfo(
                                context,
                                "DATI AZIENDALI",
                                _datiAzienda(azienda),
                              ),
                            ],

                            const SizedBox(height: 32),
                            Text(
                              "STORICO VISITE (ALLEGATO 3A)",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.primary,
                              ),
                            ),
                            const Divider(thickness: 2),

                            if (visite.isEmpty)
                              _emptyState(colorScheme)
                            else
                              _buildListaVisite(
                                context,
                                lavoratore,
                                visite,
                                colorScheme,
                              ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
          floatingActionButton: FloatingActionButton.extended(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (c) => VisitaForm(lavoratoreId: lavoratore.id),
              ),
            ),
            label: const Text('NUOVA VISITA'),
            icon: const Icon(Icons.add_moderator),
          ),
        );
      },
    );
  }

  Widget _buildBoxInfo(
    BuildContext context,
    String titolo,
    List<Widget> campi,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: colorScheme.outline, width: 1.5),
        color: colorScheme.surface,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titolo,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: colorScheme.secondary,
              fontSize: 12,
            ),
          ),
          const Divider(),
          ...campi,
        ],
      ),
    );
  }

  List<Widget> _datiLavoratore(Lavoratore l) {
    return [
      _rigaDato("COGNOME / NOME", "${l.cognome} ${l.nome}"),
      _rigaDato("SESSO", l.sesso),
      _rigaDato("CODICE FISCALE", l.codiceFiscale),
      _rigaDato(
        "NATO A",
        "${l.luogoNascita} IL ${l.dataNascita.day}/${l.dataNascita.month}/${l.dataNascita.year}",
      ),
      _rigaDato("NAZIONALITÀ", l.nazionalita),
      _rigaDato(
        "DOMICILIO",
        "${l.domicilioIndirizzo}, ${l.domicilioComune} (${l.domicilioProvincia})",
      ),
      _rigaDato("TELEFONO", l.domicilioTelefono),
    ];
  }

  List<Widget> _datiAzienda(Azienda? a) {
    return [
      _rigaDato("RAGIONE SOCIALE", a?.ragioneSociale ?? "---"),
      _rigaDato("UNITÀ PRODUTTIVA", a?.denominazioneUnitaProduttiva ?? "---"),
      _rigaDato("ATECO", a?.codiceAteco ?? "---"),
    ];
  }

  Widget _sezioneRischiSpecifici(BuildContext context, Visita visita) {
    final Map<String, bool?> mappaRischi = {
      'MMC': visita.rMmc,
      'SOVRACCARICO ARTI': visita.rSovraccaricoArti,
      'POSTURALI': visita.rPosturali,
      'CHIMICO': visita.rChimico,
      'CANCEROGENI': visita.rCancerogeni,
      'MUTAGENI': visita.rMutageni,
      'AMIANTO': visita.rAmianto,
      'SILICE': visita.rSilice,
      'BIOLOGICO': visita.rBiologico,
      'VDT': visita.rVdt,
      'VIBRAZIONI CORPO': visita.rVibrazioniCorpo,
      'VIBRAZIONI MANO': visita.rVibrazioniMano,
      'RUMORE': visita.rRumore,
      'CAMPI ELETTRO': visita.rCampiElettro,
      'ROA': visita.rRoa,
      'UV': visita.rUv,
      'MICROCLIMA': visita.rMicroclima,
      'INFRASUONI': visita.rInfrasuoni,
      'ATMOSFERE': visita.rAtmosfere,
      'NOTTURNO': visita.rNotturno,
      'RIPRODUZIONE': visita.rRiproduzione,
    };

    final rischiAttivi = mappaRischi.entries
        .where((entry) => entry.value == true)
        .map((entry) => entry.key)
        .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "RISCHI SPECIFICI:",
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 12),
          if (rischiAttivi.isEmpty)
            Text("NESSUNO", style: TextStyle(fontSize: 11, color: Colors.grey))
          else
            Expanded(
              child: Wrap(
                spacing: 6,
                runSpacing: 6,
                children: rischiAttivi
                    .map(
                      (nomeRischio) => _buildBadgeRischio(context, nomeRischio),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBadgeRischio(BuildContext context, String nome) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.primary),
        color: Theme.of(
          context,
        ).colorScheme.primaryContainer.withValues(alpha: 0.2),
      ),
      child: Text(
        nome,
        style: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _buildListaVisite(
    BuildContext context,
    Lavoratore lavoratore,
    List<Visita> visite,
    ColorScheme colors,
  ) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: visite.length,
      separatorBuilder: (c, i) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final v = visite[index];
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: colors.outlineVariant),
          ),
          child: ExpansionTile(
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        VisitaForm(lavoratoreId: lavoratore.id, visita: v),
                  ),
                );
              },
              tooltip: "Apri Visita",
              icon: Icon(Icons.assignment),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            title: Text(
              "DATA VISITA: ${v.dataVisita.day}/${v.dataVisita.month}/${v.dataVisita.year}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("GIUDIZIO: ${_mapGiudizio(v.giudizioIdoneita)}"),
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _rigaDato("MANSIONE", v.mansioneSpecifica),
                    _rigaDato("RISCHI", v.fattoriRischio3A),
                    _rigaDato("ANAMNESI", v.anamnesiPatologicaProssima),
                    _rigaDato("ESAME OBIETTIVO", v.esameObiettivo),

                    _sezioneRischiSpecifici(context, v),
                    const Divider(),
                    _rigaDato(
                      "SCADENZA",
                      v.scadenzaVisitaSuccessiva?.toIso8601String().split(
                            'T',
                          )[0] ??
                          "---",
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _rigaDato(String label, String valore) {
    return Builder(
      builder: (context) {
        final color = Theme.of(context).colorScheme.onSurface;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$label: ",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
              Expanded(
                child: Text(
                  valore.toUpperCase(),
                  style: TextStyle(color: color, fontSize: 11),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _emptyState(ColorScheme colors) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        border: Border.all(color: colors.outlineVariant),
      ),
      child: const Center(child: Text("NESSUN DATO CLINICO")),
    );
  }

  String _mapGiudizio(int id) {
    return mappaGiudizi[id] != null
        ? mappaGiudizi[id]!.toUpperCase()
        : "NON ESPLICITATO";
  }
}
