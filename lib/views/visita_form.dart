// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (c) 2026 medlav.app

// visita_form.dart updated

import 'package:drift/drift.dart' show OrderingTerm, OrderingMode, Value;
import 'package:flutter/material.dart';
import 'package:gestionale_a3/views/widgets/my_appbar.dart' show CustomAppBar;
import 'package:intl/intl.dart';
import 'package:gestionale_a3/data/database.dart'
    show Visita, AppDatabase, VisiteCompanion;
import 'package:provider/provider.dart' show Provider;

class VisitaForm extends StatefulWidget {
  final int lavoratoreId;
  final Visita? visita;

  const VisitaForm({super.key, required this.lavoratoreId, this.visita});

  @override
  State<VisitaForm> createState() => _VisitaFormState();
}

class _VisitaFormState extends State<VisitaForm> {
  final _formKey = GlobalKey<FormState>();
  final DateFormat _df = DateFormat('dd/MM/yyyy');

  // --- CONTROLLER DATI 3A ---
  late TextEditingController _repartoController;
  late TextEditingController _mansioneController;
  late TextEditingController _fattoriRischio3AController;
  late TextEditingController _anamnesiLavController;
  late TextEditingController _anamnesiFamController;
  late TextEditingController _anamnesiFisController;
  late TextEditingController _patRemotaController;
  late TextEditingController _patProssimaController;
  late TextEditingController _esameObiettivoController;
  late TextEditingController _accertamentiController;
  late TextEditingController _provvedimentiController;

  late TextEditingController _tipologiaMalattiaController;
  late TextEditingController _altriRischiController;

  late TextEditingController _variazioniProtocolloController;

  // --- DATE E STATI ---
  DateTime _dataVisita = DateTime.now();
  DateTime? _scadenzaSuccessiva;
  DateTime? _dataTrasmissioneLavoratore;
  DateTime? _dataTrasmissioneDatore;

  int _tipoVisita = 1;
  int _giudizioIdoneita = 1;

  // --- STATI BOOLEAN 3B ---
  bool _malattiaSegnalata = false;
  bool _screeningAlcol = false;
  bool _screeningSostanze = false;
  bool _invioSert = false;
  bool _dipendenzaConfermata = false;

  final Map<String, bool> _rischi3B = {
    'rMmc': false,
    'rSovraccaricoArti': false,
    'rPosturali': false,
    'rChimico': false,
    'rCancerogeni': false,
    'rMutageni': false,
    'rAmianto': false,
    'rSilice': false,
    'rBiologico': false,
    'rVdt': false,
    'rVibrazioniCorpo': false,
    'rVibrazioniMano': false,
    'rRumore': false,
    'rCampiElettro': false,
    'rRoa': false,
    'rUv': false,
    'rMicroclima': false,
    'rInfrasuoni': false,
    'rAtmosfere': false,
    'rNotturno': false,
    'rRiproduzione': false,
  };

  @override
  void initState() {
    super.initState();
    final v = widget.visita;
    _repartoController = TextEditingController(text: v?.reparto);
    _mansioneController = TextEditingController(text: v?.mansioneSpecifica);
    _fattoriRischio3AController = TextEditingController(
      text: v?.fattoriRischio3A,
    );
    _anamnesiLavController = TextEditingController(text: v?.anamnesiLavorativa);
    _anamnesiFamController = TextEditingController(text: v?.anamnesiFamiliare);
    _anamnesiFisController = TextEditingController(
      text: v?.anamnesiFisiologica,
    );
    _patRemotaController = TextEditingController(
      text: v?.anamnesiPatologicaRemota,
    );
    _patProssimaController = TextEditingController(
      text: v?.anamnesiPatologicaProssima,
    );
    _esameObiettivoController = TextEditingController(text: v?.esameObiettivo);
    _accertamentiController = TextEditingController(
      text: v?.accertamentiIntegrativi,
    );
    _provvedimentiController = TextEditingController(
      text: v?.provvedimentiMedico,
    );
    _tipologiaMalattiaController = TextEditingController(
      text: v?.tipologiaMalattia,
    );
    _altriRischiController = TextEditingController(text: v?.rAltriRischi);

    _variazioniProtocolloController = TextEditingController();

    if (v != null) {
      _dataVisita = v.dataVisita;
      _scadenzaSuccessiva = v.scadenzaVisitaSuccessiva;
      _dataTrasmissioneLavoratore = v.dataTrasmissioneLavoratore;
      _dataTrasmissioneDatore = v.dataTrasmissioneDatore;
      _tipoVisita = v.tipoVisita;
      _giudizioIdoneita = v.giudizioIdoneita;
      _malattiaSegnalata = v.malattiaProfSegnalata;
      _screeningAlcol = v.screeningAlcol;
      _screeningSostanze = v.screeningSostanze;
      _invioSert = v.invioSert;
      _dipendenzaConfermata = v.dipendenzaConfermata;
    }
  }

  Future<void> _duplicaVisita(AppDatabase db) async {
    final ultima =
        await (db.select(db.visite)
              ..where((t) => t.lavoratoreId.equals(widget.lavoratoreId))
              ..orderBy([
                (t) => OrderingTerm(
                  expression: t.dataVisita,
                  mode: OrderingMode.desc,
                ),
              ])
              ..limit(1))
            .getSingleOrNull();

    if (ultima != null) {
      setState(() {
        // --- DATI 3A ---
        _repartoController.text = ultima.reparto ?? '';
        _mansioneController.text = ultima.mansioneSpecifica;
        _fattoriRischio3AController.text = ultima.fattoriRischio3A;
        _anamnesiLavController.text = ultima.anamnesiLavorativa;
        _anamnesiFamController.text = ultima.anamnesiFamiliare;
        _anamnesiFisController.text = ultima.anamnesiFisiologica;
        _patRemotaController.text = ultima.anamnesiPatologicaRemota;
        _patProssimaController.text = ultima.anamnesiPatologicaProssima;
        _esameObiettivoController.text = ultima.esameObiettivo;
        _accertamentiController.text = ultima.accertamentiIntegrativi;
        _provvedimentiController.text = ultima.provvedimentiMedico ?? '';
        _tipologiaMalattiaController.text = ultima.tipologiaMalattia ?? '';
        _altriRischiController.text = ultima.rAltriRischi ?? '';

        // --- DATE E STATI ---
        _dataVisita = DateTime.now();
        _tipoVisita = 2; // Periodica
        _giudizioIdoneita = ultima.giudizioIdoneita;

        // --- ALLEGATO 3B - MALATTIE E SCREENING ---
        _malattiaSegnalata = ultima.malattiaProfSegnalata;
        _screeningAlcol = ultima.screeningAlcol;
        _screeningSostanze = ultima.screeningSostanze;
        _invioSert = ultima.invioSert;
        _dipendenzaConfermata = ultima.dipendenzaConfermata;

        // --- ALLEGATO 3B - RISCHI ---
        _rischi3B['rMmc'] = ultima.rMmc;
        _rischi3B['rSovraccaricoArti'] = ultima.rSovraccaricoArti;
        _rischi3B['rPosturali'] = ultima.rPosturali;
        _rischi3B['rChimico'] = ultima.rChimico;
        _rischi3B['rCancerogeni'] = ultima.rCancerogeni;
        _rischi3B['rMutageni'] = ultima.rMutageni;
        _rischi3B['rAmianto'] = ultima.rAmianto;
        _rischi3B['rSilice'] = ultima.rSilice;
        _rischi3B['rBiologico'] = ultima.rBiologico;
        _rischi3B['rVdt'] = ultima.rVdt;
        _rischi3B['rVibrazioniCorpo'] = ultima.rVibrazioniCorpo;
        _rischi3B['rVibrazioniMano'] = ultima.rVibrazioniMano;
        _rischi3B['rRumore'] = ultima.rRumore;
        _rischi3B['rCampiElettro'] = ultima.rCampiElettro;
        _rischi3B['rRoa'] = ultima.rRoa;
        _rischi3B['rUv'] = ultima.rUv;
        _rischi3B['rMicroclima'] = ultima.rMicroclima;
        _rischi3B['rInfrasuoni'] = ultima.rInfrasuoni;
        _rischi3B['rAtmosfere'] = ultima.rAtmosfere;
        _rischi3B['rNotturno'] = ultima.rNotturno;
        _rischi3B['rRiproduzione'] = ultima.rRiproduzione;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Dati importati dall\'ultima visita')),
        );
      });
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Nessuno storico trovato per questo lavoratore'),
          ),
        );
      }
    }
  }

  Future<void> _save() async {
    if (_formKey.currentState!.validate()) {
      final db = Provider.of<AppDatabase>(context, listen: false);

      final companion = VisiteCompanion.insert(
        lavoratoreId: widget.lavoratoreId,
        dataVisita: _dataVisita,
        tipoVisita: _tipoVisita,
        giudizioIdoneita: _giudizioIdoneita,

        reparto: Value(_repartoController.text),
        mansioneSpecifica: _mansioneController.text,
        fattoriRischio3A: _fattoriRischio3AController.text,
        anamnesiLavorativa: _anamnesiLavController.text,
        anamnesiFamiliare: _anamnesiFamController.text,
        anamnesiFisiologica: _anamnesiFisController.text,
        anamnesiPatologicaRemota: _patRemotaController.text,
        anamnesiPatologicaProssima: _patProssimaController.text,
        esameObiettivo: _esameObiettivoController.text,
        accertamentiIntegrativi: _accertamentiController.text,
        provvedimentiMedico: Value(_provvedimentiController.text),

        scadenzaVisitaSuccessiva: Value(_scadenzaSuccessiva),
        dataTrasmissioneLavoratore: Value(_dataTrasmissioneLavoratore),
        dataTrasmissioneDatore: Value(_dataTrasmissioneDatore),

        // --- ALLEGATO 3B - BOLEANI ---
        malattiaProfSegnalata: Value(_malattiaSegnalata),
        tipologiaMalattia: Value(_tipologiaMalattiaController.text),
        screeningAlcol: Value(_screeningAlcol),
        screeningSostanze: Value(_screeningSostanze),
        invioSert: Value(_invioSert),
        dipendenzaConfermata: Value(_dipendenzaConfermata),

        // --- ALLEGATO 3B - RISCHI ---
        rMmc: Value(_rischi3B['rMmc'] ?? false),
        rSovraccaricoArti: Value(_rischi3B['rSovraccaricoArti'] ?? false),
        rPosturali: Value(_rischi3B['rPosturali'] ?? false),
        rChimico: Value(_rischi3B['rChimico'] ?? false),
        rCancerogeni: Value(_rischi3B['rCancerogeni'] ?? false),
        rMutageni: Value(_rischi3B['rMutageni'] ?? false),
        rAmianto: Value(_rischi3B['rAmianto'] ?? false),
        rSilice: Value(_rischi3B['rSilice'] ?? false),
        rBiologico: Value(_rischi3B['rBiologico'] ?? false),
        rVdt: Value(_rischi3B['rVdt'] ?? false),
        rVibrazioniCorpo: Value(_rischi3B['rVibrazioniCorpo'] ?? false),
        rVibrazioniMano: Value(_rischi3B['rVibrazioniMano'] ?? false),
        rRumore: Value(_rischi3B['rRumore'] ?? false),
        rCampiElettro: Value(_rischi3B['rCampiElettro'] ?? false),
        rRoa: Value(_rischi3B['rRoa'] ?? false),
        rUv: Value(_rischi3B['rUv'] ?? false),
        rMicroclima: Value(_rischi3B['rMicroclima'] ?? false),
        rInfrasuoni: Value(_rischi3B['rInfrasuoni'] ?? false),
        rAtmosfere: Value(_rischi3B['rAtmosfere'] ?? false),
        rNotturno: Value(_rischi3B['rNotturno'] ?? false),
        rRiproduzione: Value(_rischi3B['rRiproduzione'] ?? false),
        rAltriRischi: Value(_altriRischiController.text),
      );

      try {
        if (widget.visita == null) {
          await db.into(db.visite).insert(companion);
        } else {
          await (db.update(
            db.visite,
          )..where((t) => t.id.equals(widget.visita!.id))).write(companion);
        }
        if (mounted) Navigator.pop(context);
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('ERRORE: $e')));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Cartella Sanitaria',
        actions: [
          IconButton(
            onPressed: () => _duplicaVisita(db),
            icon: const Icon(Icons.copy),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _section(context, 'DATI GENERALI E TIPOLOGIA VISITA'),
              _buildDatePicker(
                context,
                "Data Visita",
                _dataVisita,
                (d) => setState(() => _dataVisita = d),
              ),
              _buildDrop('Tipo Visita', _tipoVisita, {
                1: 'Preventiva',
                2: 'Periodica',
                3: 'Su richiesta',
                4: 'Cambio mansione',
                5: 'Fine rapporto',
                6: 'Pre-assuntiva',
                7: 'Dopo malattia (>60gg)',
              }, (v) => setState(() => _tipoVisita = v!)),
              _field(_repartoController, 'Reparto', maxLines: 3),
              _field(_mansioneController, 'Mansione Specifica', maxLines: 4),
              _field(
                _fattoriRischio3AController,
                'Fattori di Rischio Specifici',
                minLines: 2,
              ),

              _section(context, 'ANAMNESI'),
              _field(
                _anamnesiLavController,
                'Anamnesi Lavorativa',
                minLines: 4,
              ),
              _field(_anamnesiFamController, 'Anamnesi Familiare', minLines: 4),
              _field(
                _anamnesiFisController,
                'Anamnesi Fisiologica',
                minLines: 4,
              ),
              _field(
                _patRemotaController,
                'Anamnesi Patologica Remota',
                minLines: 4,
              ),
              _field(
                _patProssimaController,
                'Anamnesi Patologica Prossima',
                minLines: 4,
              ),

              _section(context, 'ESAME OBIETTIVO E ACCERTAMENTI'),
              _field(_esameObiettivoController, 'Esame Obiettivo', minLines: 3),
              _field(
                _accertamentiController,
                'Accertamenti Integrativi',
                minLines: 2,
              ),
              _field(
                _variazioniProtocolloController,
                'Variazioni Protocollo',
                minLines: 2,
              ),

              _section(context, 'RISCHI SPECIFICI AGGREGATI (Allegato 3B)'),
              Wrap(
                spacing: 8,
                children: _rischi3B.keys
                    .map(
                      (k) => FilterChip(
                        label: Text(k.replaceFirst('r', '').toUpperCase()),
                        selected: _rischi3B[k]!,
                        onSelected: (v) => setState(() => _rischi3B[k] = v),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 10),
              _field(
                _altriRischiController,
                'Eventuali Altri Rischi (3B)',
                minLines: 3,
              ),

              _section(context, 'GIUDIZIO DI IDONEITÀ'),
              _buildDrop(
                'Giudizio',
                _giudizioIdoneita,
                {
                  1: 'Idoneo',
                  2: 'Idoneo con prescrizioni',
                  3: 'Inidoneo temporaneo',
                  4: 'Inidoneo permanente',
                },
                (v) => setState(() => _giudizioIdoneita = v!),
              ),
              _field(
                _provvedimentiController,
                'Provvedimenti Medico',
                minLines: 2,
              ),
              _buildDatePicker(
                context,
                "Scadenza Successiva",
                _scadenzaSuccessiva,
                (d) => setState(() => _scadenzaSuccessiva = d),
              ),

              _section(context, 'TRASMISSIONE E COMUNICAZIONE'),
              _buildDatePicker(
                context,
                "Data al Lavoratore",
                _dataTrasmissioneLavoratore,
                (d) => setState(() => _dataTrasmissioneLavoratore = d),
              ),
              _buildDatePicker(
                context,
                "Data al Datore",
                _dataTrasmissioneDatore,
                (d) => setState(() => _dataTrasmissioneDatore = d),
              ),

              _section(context, 'MALATTIE PROFESSIONALI, ALCOL E DROGHE (3B)'),
              SwitchListTile(
                title: const Text(
                  'Malattia Professionale Segnalata (Art. 139)',
                ),
                value: _malattiaSegnalata,
                onChanged: (v) => setState(() => _malattiaSegnalata = v),
              ),
              if (_malattiaSegnalata)
                _field(
                  _tipologiaMalattiaController,
                  'Tipologia Malattia (Specifica codice/tipo)',
                ),

              CheckboxListTile(
                title: const Text('Screening Alcol'),
                value: _screeningAlcol,
                onChanged: (v) => setState(() => _screeningAlcol = v!),
              ),
              CheckboxListTile(
                title: const Text('Screening Sostanze'),
                value: _screeningSostanze,
                onChanged: (v) => setState(() => _screeningSostanze = v!),
              ),
              if (_screeningAlcol || _screeningSostanze) ...[
                CheckboxListTile(
                  title: const Text('Invio SERT'),
                  value: _invioSert,
                  onChanged: (v) => setState(() => _invioSert = v!),
                ),
                CheckboxListTile(
                  title: const Text('Dipendenza Confermata'),
                  value: _dipendenzaConfermata,
                  onChanged: (v) => setState(() => _dipendenzaConfermata = v!),
                ),
              ],

              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _save,
                child: const Text('SALVA CARTELLA SANITARIA'),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget _section(BuildContext context, String t) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.toUpperCase(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 4),
        Divider(color: Theme.of(context).colorScheme.primary, thickness: 3),
      ],
    ),
  );

  Widget _field(
    TextEditingController c,
    String l, {
    int maxLines = 1,
    int minLines = 1,
  }) {
    if (maxLines < minLines) {
      maxLines = minLines;
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: c,
        maxLines: maxLines == 1 ? 1 : null,
        minLines: minLines,
        style: const TextStyle(fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          labelText: l.toUpperCase(),
          alignLabelWithHint: true,
        ),
      ),
    );
  }

  Widget _buildDatePicker(
    BuildContext context,
    String label,
    DateTime? selectedDate,
    Function(DateTime) onSelect,
  ) => Container(
    margin: const EdgeInsets.only(bottom: 16),
    decoration: BoxDecoration(
      border: Border.all(
        color: Theme.of(context).colorScheme.outline,
        width: 2,
      ),
    ),
    child: ListTile(
      tileColor: Theme.of(context).colorScheme.surface,
      title: Text(
        "${label.toUpperCase()}: ${selectedDate == null ? '---' : _df.format(selectedDate)}",
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ),
      trailing: Icon(
        Icons.calendar_today,
        color: Theme.of(context).colorScheme.primary,
      ),
      onTap: () async {
        final d = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (d != null) onSelect(d);
      },
    ),
  );

  Widget _buildDrop(
    String l,
    int val,
    Map<int, String> items,
    Function(int?) onCh,
  ) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: DropdownButtonFormField<int>(
      initialValue: val,
      decoration: InputDecoration(
        labelText: l,
        border: const OutlineInputBorder(),
      ),
      items: items.entries
          .map((e) => DropdownMenuItem(value: e.key, child: Text(e.value)))
          .toList(),
      onChanged: onCh,
    ),
  );
}
