// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (c) 2026 medlav.app

// lavoratori_form.dart

import 'package:flutter/material.dart';
import 'package:gestionale_a3/theme.dart' show AppTheme;
import 'package:gestionale_a3/views/azienda_form.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as d;
import 'package:intl/intl.dart';
import 'package:gestionale_a3/data/database.dart'
    show Lavoratore, AppDatabase, LavoratoriCompanion, Azienda;
import 'package:gestionale_a3/views/widgets/my_appbar.dart';

class LavoratoriForm extends StatefulWidget {
  final int? aziendaId;
  final Lavoratore? lavoratore;

  const LavoratoriForm({super.key, this.aziendaId, this.lavoratore});

  @override
  State<LavoratoriForm> createState() => _LavoratoriFormState();
}

class _LavoratoriFormState extends State<LavoratoriForm> {
  final _formKey = GlobalKey<FormState>();
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  late TextEditingController _cognomeController;
  late TextEditingController _nomeController;
  late TextEditingController _luogoNascitaController;
  late TextEditingController _domicilioComuneController;
  late TextEditingController _domicilioProvinciaController;
  late TextEditingController _domicilioIndirizzoController;
  late TextEditingController _domicilioTelefonoController;
  late TextEditingController _nazionalitaController;
  late TextEditingController _cfController;

  int? _aziendaSelezionataId;

  String _sesso = 'M';
  DateTime? _dataNascita;

  @override
  void initState() {
    super.initState();
    _cognomeController = TextEditingController(
      text: widget.lavoratore?.cognome,
    );
    _nomeController = TextEditingController(text: widget.lavoratore?.nome);
    _luogoNascitaController = TextEditingController(
      text: widget.lavoratore?.luogoNascita,
    );
    _domicilioComuneController = TextEditingController(
      text: widget.lavoratore?.domicilioComune,
    );
    _domicilioProvinciaController = TextEditingController(
      text: widget.lavoratore?.domicilioProvincia,
    );
    _domicilioIndirizzoController = TextEditingController(
      text: widget.lavoratore?.domicilioIndirizzo,
    );
    _domicilioTelefonoController = TextEditingController(
      text: widget.lavoratore?.domicilioTelefono,
    );
    _nazionalitaController = TextEditingController(
      text: widget.lavoratore?.nazionalita,
    );
    _cfController = TextEditingController(
      text: widget.lavoratore?.codiceFiscale,
    );

    _sesso = widget.lavoratore?.sesso ?? 'M';
    _dataNascita = widget.lavoratore?.dataNascita;
  }

  @override
  void dispose() {
    _cognomeController.dispose();
    _nomeController.dispose();
    _luogoNascitaController.dispose();
    _domicilioComuneController.dispose();
    _domicilioProvinciaController.dispose();
    _domicilioIndirizzoController.dispose();
    _domicilioTelefonoController.dispose();
    _nazionalitaController.dispose();
    _cfController.dispose();
    super.dispose();
  }

  Future<void> _selezionaData(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dataNascita ?? DateTime(1990),
      firstDate: DateTime(1940),
      lastDate: DateTime.now(),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: Theme.of(context).colorScheme,
          dialogTheme: DialogThemeData(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
        ),
        child: child!,
      ),
    );
    if (picked != null && picked != _dataNascita) {
      setState(() => _dataNascita = picked);
    }
  }

  Future<void> _salvaLavoratore() async {
    if (!_formKey.currentState!.validate()) return;

    if (_dataNascita == null) {
      _mostraErrore("Seleziona la data di nascita.");
      return;
    }

    final db = Provider.of<AppDatabase>(context, listen: false);

    if (widget.aziendaId == null && _aziendaSelezionataId == null) {
      _mostraErrore("Devi prima selezionare o creare un azienda!");
      return;
    }

    final companion = LavoratoriCompanion(
      aziendaId: d.Value(_aziendaSelezionataId ?? widget.aziendaId!),
      cognome: d.Value(_cognomeController.text),
      nome: d.Value(_nomeController.text),
      sesso: d.Value(_sesso),
      luogoNascita: d.Value(_luogoNascitaController.text),
      dataNascita: d.Value(_dataNascita!),
      domicilioComune: d.Value(_domicilioComuneController.text),
      domicilioProvincia: d.Value(_domicilioProvinciaController.text),
      domicilioIndirizzo: d.Value(_domicilioIndirizzoController.text),
      domicilioTelefono: d.Value(_domicilioTelefonoController.text),
      nazionalita: d.Value(_nazionalitaController.text),
      codiceFiscale: d.Value(_cfController.text.toUpperCase().trim()),
    );

    try {
      if (widget.lavoratore == null) {
        await db.into(db.lavoratori).insert(companion);
      } else {
        await (db.update(
          db.lavoratori,
        )..where((t) => t.id.equals(widget.lavoratore!.id))).write(companion);
      }
      if (mounted) Navigator.pop(context);
    } catch (e) {
      _mostraErrore(e.toString());
    }
  }

  void _mostraErrore(String messaggio) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        title: const Text('ERRORE DI VALIDAZIONE'),
        content: Text(messaggio.replaceFirst('InvalidDataException: ', '')),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: CustomAppBar(
        title: widget.lavoratore == null
            ? 'NUOVO LAVORATORE'
            : 'MODIFICA LAVORATORE',
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            StreamBuilder<List<Azienda>>(
              stream: db.select(db.aziende).watch(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                final aziende = snapshot.data ?? [];

                if (aziende.isEmpty) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: colorScheme.errorContainer.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.zero,
                      border: Border.all(color: colorScheme.error),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.warning_amber_rounded,
                          color: colorScheme.error,
                          size: 40,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'CREA UNA AZIENDA PRIMA DI INSERIRE LAVORATORI!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.error,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AziendeForm(),
                              ),
                            );
                          },
                          child: const Text('VAI A GESTIONE AZIENDE'),
                        ),
                      ],
                    ),
                  );
                }

                return DropdownButtonFormField<int>(
                  initialValue:
                      _aziendaSelezionataId ??
                      (widget.lavoratore?.aziendaId ?? widget.aziendaId),
                  decoration: const InputDecoration(
                    labelText: 'AZIENDA DI APPARTENENZA',
                    prefixIcon: Icon(Icons.business),
                  ),
                  items: aziende
                      .map(
                        (az) => DropdownMenuItem(
                          value: az.id,
                          child: Text(az.ragioneSociale.toUpperCase()),
                        ),
                      )
                      .toList(),
                  onChanged: (val) =>
                      setState(() => _aziendaSelezionataId = val),
                  validator: (val) =>
                      val == null ? 'SELEZIONA UN\'AZIENDA' : null,
                );
              },
            ),

            _sectionHeader('DATI ANAGRAFICI'),

            _buildTextField(_cognomeController, 'COGNOME'),
            _buildTextField(_nomeController, 'NOME'),
            _buildTextField(_cfController, 'CODICE FISCALE', maxLength: 16),

            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    initialValue: _sesso,
                    decoration: const InputDecoration(labelText: 'SESSO'),
                    items: const [
                      DropdownMenuItem(value: 'M', child: Text('MASCHIO')),
                      DropdownMenuItem(value: 'F', child: Text('FEMMINA')),
                    ],
                    onChanged: (val) => setState(() => _sesso = val!),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: InkWell(
                    onTap: () => _selezionaData(context),
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelText: 'DATA DI NASCITA',
                      ),
                      child: Text(
                        _dataNascita == null
                            ? 'SELEZIONA'
                            : _dateFormat.format(_dataNascita!),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildTextField(_luogoNascitaController, 'LUOGO DI NASCITA'),
            _buildTextField(_nazionalitaController, 'NAZIONALITÀ'),

            _sectionHeader('DOMICILIO E CONTATTI'),

            _buildTextField(
              _domicilioIndirizzoController,
              'INDIRIZZO (VIA E NUMERO)',
            ),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(_domicilioComuneController, 'COMUNE'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildTextField(
                    _domicilioProvinciaController,
                    'PROVINCIA',
                    maxLength: 2,
                  ),
                ),
              ],
            ),
            _buildTextField(
              _domicilioTelefonoController,
              'TELEFONO / RECAPITO',
              keyboardType: TextInputType.phone,
            ),

            const SizedBox(height: 30),
            SizedBox(
              height: 60,
              child: ElevatedButton(
                style: AppTheme.buttonAccent,

                onPressed: _salvaLavoratore,
                child: const Text('SALVA LAVORATORE'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
              letterSpacing: 1.5,
            ),
          ),
          const Divider(thickness: 2),
        ],
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label, {
    int? maxLength,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        controller: controller,
        maxLength: maxLength,
        keyboardType: keyboardType,
        style: const TextStyle(fontWeight: FontWeight.bold),
        decoration: InputDecoration(labelText: label, counterText: ""),
        validator: (value) =>
            value == null || value.isEmpty ? 'OBBLIGATORIO' : null,
      ),
    );
  }
}
