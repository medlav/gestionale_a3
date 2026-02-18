// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (c) 2026 medlav.app

// aziende_form.dart

import 'package:flutter/material.dart';
import 'package:gestionale_a3/theme.dart' show AppTheme;
import 'package:gestionale_a3/views/widgets/my_appbar.dart' show CustomAppBar;
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as d;
import 'package:gestionale_a3/data/database.dart'
    show AppDatabase, Azienda, AziendeCompanion;

class AziendeForm extends StatefulWidget {
  final Azienda? azienda;

  const AziendeForm({super.key, this.azienda});

  @override
  State<AziendeForm> createState() => _AziendeFormState();
}

class _AziendeFormState extends State<AziendeForm> {
  final _formKey = GlobalKey<FormState>();

  // Controller per dati anagrafici
  late TextEditingController _ragioneSocialeController;
  late TextEditingController _pivaCfController;
  late TextEditingController _cfSocietaController;
  late TextEditingController _sedeLegaleController;
  late TextEditingController _denominazioneUpController;
  late TextEditingController _indirizzoUpController;
  late TextEditingController _atecoController;

  // Controller per dati occupazionali (3B)
  late TextEditingController _m3006Controller;
  late TextEditingController _f3006Controller;
  late TextEditingController _m3112Controller;
  late TextEditingController _f3112Controller;

  @override
  void initState() {
    super.initState();
    _ragioneSocialeController = TextEditingController(
      text: widget.azienda?.ragioneSociale,
    );
    _pivaCfController = TextEditingController(
      text: widget.azienda?.partitaIvaCf,
    );
    _cfSocietaController = TextEditingController(
      text: widget.azienda?.codiceFiscaleSocieta,
    );
    _sedeLegaleController = TextEditingController(
      text: widget.azienda?.indirizzoSedeLegale,
    );
    _denominazioneUpController = TextEditingController(
      text: widget.azienda?.denominazioneUnitaProduttiva,
    );
    _indirizzoUpController = TextEditingController(
      text: widget.azienda?.indirizzoUnitaProduttiva,
    );
    _atecoController = TextEditingController(text: widget.azienda?.codiceAteco);

    _m3006Controller = TextEditingController(
      text: widget.azienda?.occupati3006Maschi.toString() ?? '0',
    );
    _f3006Controller = TextEditingController(
      text: widget.azienda?.occupati3006Femmine.toString() ?? '0',
    );
    _m3112Controller = TextEditingController(
      text: widget.azienda?.occupati3112Maschi.toString() ?? '0',
    );
    _f3112Controller = TextEditingController(
      text: widget.azienda?.occupati3112Femmine.toString() ?? '0',
    );
  }

  @override
  void dispose() {
    _ragioneSocialeController.dispose();
    _pivaCfController.dispose();
    _cfSocietaController.dispose();
    _sedeLegaleController.dispose();
    _denominazioneUpController.dispose();
    _indirizzoUpController.dispose();
    _atecoController.dispose();
    _m3006Controller.dispose();
    _f3006Controller.dispose();
    _m3112Controller.dispose();
    _f3112Controller.dispose();
    super.dispose();
  }

  Future<void> _saveForm() async {
    if (_formKey.currentState!.validate()) {
      final db = Provider.of<AppDatabase>(context, listen: false);

      final companion = AziendeCompanion(
        ragioneSociale: d.Value(_ragioneSocialeController.text),
        partitaIvaCf: d.Value(_pivaCfController.text),
        codiceFiscaleSocieta: d.Value(_cfSocietaController.text),
        indirizzoSedeLegale: d.Value(_sedeLegaleController.text),
        denominazioneUnitaProduttiva: d.Value(_denominazioneUpController.text),
        indirizzoUnitaProduttiva: d.Value(_indirizzoUpController.text),
        codiceAteco: d.Value(_atecoController.text),
        occupati3006Maschi: d.Value(int.parse(_m3006Controller.text)),
        occupati3006Femmine: d.Value(int.parse(_f3006Controller.text)),
        occupati3112Maschi: d.Value(int.parse(_m3112Controller.text)),
        occupati3112Femmine: d.Value(int.parse(_f3112Controller.text)),
      );

      if (widget.azienda == null) {
        await db.into(db.aziende).insert(companion);
      } else {
        await (db.update(
          db.aziende,
        )..where((t) => t.id.equals(widget.azienda!.id))).write(companion);
      }

      if (mounted) Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.azienda == null ? 'NUOVA AZIENDA' : 'MODIFICA AZIENDA',
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _sectionTitle('Dati Identificativi (Allegato 3A/3B)'),
            _buildTextField(
              _ragioneSocialeController,
              'Ragione Sociale (Nome)',
            ),
            _buildTextField(_pivaCfController, 'Partita IVA / CF'),
            _buildTextField(_cfSocietaController, 'Codice Fiscale Società'),
            _buildTextField(
              _sedeLegaleController,
              'Indirizzo Sede Legale (Via e N.)',
            ),
            _buildTextField(
              _denominazioneUpController,
              'Denominazione Unità Produttiva',
            ),
            _buildTextField(
              _indirizzoUpController,
              'Indirizzo Unità Produttiva',
            ),
            _buildTextField(_atecoController, 'Codice ATECO'),

            const Divider(height: 40),
            _sectionTitle('Dati Occupazionali (Allegato 3B)'),
            Row(
              children: [
                Expanded(
                  child: _buildNumberField(_m3006Controller, 'M al 30/06'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildNumberField(_f3006Controller, 'F al 30/06'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _buildNumberField(_m3112Controller, 'M al 31/12'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildNumberField(_f3112Controller, 'F al 31/12'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _saveForm,
              style: AppTheme.buttonAccent,
              child: const Text('SALVA AZIENDA'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label.toUpperCase(),
          border: const OutlineInputBorder(),
        ),
        validator: (value) =>
            value == null || value.isEmpty ? 'CAMPO OBBLIGATORIO' : null,
      ),
    );
  }

  Widget _buildNumberField(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (value) => value == null || int.tryParse(value) == null
          ? 'Inserire numero'
          : null,
    );
  }
}
