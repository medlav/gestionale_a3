// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (c) 2026 medlav.app

import 'dart:convert' show utf8;
import 'dart:io';
import 'dart:math' show max;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gestionale_a3/views/widgets/my_appbar.dart' show CustomAppBar;
import 'package:provider/provider.dart';
import 'package:gestionale_a3/data/database.dart';
import 'package:gestionale_a3/data/repository_3b.dart';
import 'package:gestionale_a3/data/convertitore_xml_3b.dart';
import 'package:gestionale_a3/theme.dart';
import 'package:file_picker/file_picker.dart';

class View3B extends StatefulWidget {
  const View3B({super.key});

  @override
  State<View3B> createState() => _View3BState();
}

class _View3BState extends State<View3B> {
  int? _selectedAziendaId;
  int _selectedAnno = DateTime.now().year - 1;
  Map<String, dynamic>? _datiAggregati;
  bool _isLoading = false;

  Future<void> _caricaDati() async {
    if (_selectedAziendaId == null) return;
    setState(() => _isLoading = true);
    final repo = Repository3B(Provider.of<AppDatabase>(context, listen: false));
    final dati = await repo.generaDatiAggregati(
      aziendaId: _selectedAziendaId!,
      anno: _selectedAnno,
    );
    setState(() {
      _datiAggregati = dati;
      _isLoading = false;
    });
  }

  Future<void> _esportaXml() async {
    if (_datiAggregati == null) return;

    final convertitore = ConvertitoreXml3B();
    final xmlString = convertitore.generaXmlInail(_datiAggregati!);
    final String nomeFileDefault = 'Allegato_3B_$_selectedAnno.xml';

    try {
      String? pathScelto = await FilePicker.platform.saveFile(
        dialogTitle: 'SALVA ALLEGATO 3B',
        fileName: nomeFileDefault,
        type: FileType.custom,
        allowedExtensions: ['xml'],
      );

      if (pathScelto != null) {
        final file = File(pathScelto);
        await file.writeAsString(xmlString, encoding: utf8);

        if (mounted) {
          late OverlayEntry overlayEntry;
          overlayEntry = OverlayEntry(
            builder: (context) => Material(
              color: Colors.transparent,
              child: Center(
                child: Container(
                  width: max(MediaQuery.of(context).size.width / 2, 100),
                  height: max(MediaQuery.of(context).size.height / 8, 100),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    border: Border.all(color: Colors.green, width: 3),
                  ),
                  child: const Center(
                    child: Text(
                      "FILE SALVATO",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );

          Overlay.of(context).insert(overlayEntry);

          Future.delayed(const Duration(milliseconds: 1500), () {
            overlayEntry.remove();
          });
        }
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint("ERRORE DURANTE IL SALVATAGGIO: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: CustomAppBar(title: '3B - INVIO TELEMATICO INAIL'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: StreamBuilder<List<Azienda>>(
                    stream: db.select(db.aziende).watch(),
                    builder: (context, snapshot) {
                      final aziende = snapshot.data ?? [];
                      return DropdownButtonFormField<int>(
                        initialValue: _selectedAziendaId,
                        hint: const Text('SELEZIONA AZIENDA'),
                        items: aziende
                            .map(
                              (a) => DropdownMenuItem(
                                value: a.id,
                                child: Text(a.ragioneSociale.toUpperCase()),
                              ),
                            )
                            .toList(),
                        onChanged: (val) {
                          setState(() => _selectedAziendaId = val);
                          _caricaDati();
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 100,
                  child: DropdownButtonFormField<int>(
                    initialValue: _selectedAnno,
                    items: [2024, 2025, 2026, 2027, 2028]
                        .map(
                          (anno) => DropdownMenuItem(
                            value: anno,
                            child: Text(anno.toString()),
                          ),
                        )
                        .toList(),
                    onChanged: (val) {
                      setState(() => _selectedAnno = val!);
                      _caricaDati();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            if (_isLoading)
              const Expanded(child: Center(child: CircularProgressIndicator()))
            else if (_datiAggregati == null)
              const Expanded(
                child: Center(
                  child: Text(
                    "SELEZIONA UN'AZIENDA",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            else
              Expanded(
                child: ListView(
                  children: [
                    _sectionHeader(context, 'RIEPILOGO SORVEGLIANZA'),
                    _StatTile(
                      label: 'LAVORATORI VISITATI (M/F)',
                      value:
                          '${_datiAggregati!['sorveglianza']['visitatiM']} / ${_datiAggregati!['sorveglianza']['visitatiF']}',
                    ),
                    _StatTile(
                      label: 'IDONEI TOTALI',
                      value:
                          '${_datiAggregati!['sorveglianza']['idoneiM'] + _datiAggregati!['sorveglianza']['idoneiF']}',
                    ),
                    _StatTile(
                      label: 'MALATTIE SEGNALATE',
                      value:
                          '${_datiAggregati!['malattie']['maschi'] + _datiAggregati!['malattie']['femmine']}',
                    ),
                    const SizedBox(height: 16),
                    _sectionHeader(context, 'DETTAGLIO RISCHI'),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: colorScheme.outline,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children:
                            (_datiAggregati!['rischi']
                                    as Map<String, Map<String, int>>)
                                .entries
                                .where(
                                  (e) => e.value['vM']! + e.value['vF']! > 0,
                                )
                                .map(
                                  (e) => Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: colorScheme.outline,
                                        ),
                                      ),
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        e.key
                                            .replaceFirst('r', '')
                                            .toUpperCase(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      trailing: Text(
                                        'VISITATI: ${e.value['vM']! + e.value['vF']!}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                      ),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _datiAggregati == null ? null : _esportaXml,
                icon: const Icon(Icons.download_rounded),
                label: const Text('ESPORTA XML (ALLEGATO 3B)'),
                style: AppTheme.buttonAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(BuildContext context, String title) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
          letterSpacing: 1.5,
        ),
      ),
      const Divider(thickness: 3),
      const SizedBox(height: 8),
    ],
  );
}

class _StatTile extends StatelessWidget {
  final String label;
  final String value;
  const _StatTile({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: ListTile(
        title: Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
