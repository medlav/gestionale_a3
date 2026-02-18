// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (c) 2026 medlav.app

import 'package:flutter/material.dart';
import 'package:gestionale_a3/views/lavoratore_form.dart' show LavoratoriForm;
import 'package:gestionale_a3/views/view_3a.dart';
import 'package:provider/provider.dart';
import 'package:gestionale_a3/data/database.dart';

class LavoratoriListView extends StatefulWidget {
  const LavoratoriListView({super.key});

  @override
  State<LavoratoriListView> createState() => _LavoratoriListViewState();
}

class _LavoratoriListViewState extends State<LavoratoriListView> {
  final Set<int> _selectedIds = {};
  bool _isSelectionMode = false;
  String _searchQuery = '';

  void _toggleSelection(int id) {
    setState(() {
      if (_selectedIds.contains(id)) {
        _selectedIds.remove(id);
        if (_selectedIds.isEmpty) _isSelectionMode = false;
      } else {
        _selectedIds.add(id);
        _isSelectionMode = true;
      }
    });
  }

  Future<void> _deleteSelected(AppDatabase db) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        title: const Text('CONFERMA ELIMINAZIONE'),
        content: Text(
          'Eliminare definitivamente ${_selectedIds.length} lavoratori?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('ANNULLA'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              'ELIMINA',
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await (db.delete(
        db.lavoratori,
      )..where((t) => t.id.isIn(_selectedIds))).go();

      setState(() {
        _selectedIds.clear();
        _isSelectionMode = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          (_isSelectionMode
                  ? '${_selectedIds.length} SELEZIONATI'
                  : 'LAVORATORI')
              .toUpperCase(),
        ),
        actions: [
          if (_isSelectionMode) ...[
            IconButton(icon: const Icon(Icons.select_all), onPressed: () {}),
            IconButton(
              icon: Icon(Icons.delete, color: colorScheme.error),
              onPressed: () => _deleteSelected(db),
            ),
          ],
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: TextField(
              style: const TextStyle(fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: 'Cerca per nome, cognome, etc..',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: colorScheme.surface,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              onChanged: (value) =>
                  setState(() => _searchQuery = value.toLowerCase()),
            ),
          ),
        ),
      ),
      body: StreamBuilder<List<Lavoratore>>(
        stream: db.select(db.lavoratori).watch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          var lavoratori = snapshot.data ?? [];
          if (_searchQuery.isNotEmpty) {
            lavoratori = lavoratori
                .where(
                  (l) =>
                      l.cognome.toLowerCase().contains(_searchQuery) ||
                      l.codiceFiscale.toLowerCase().contains(_searchQuery),
                )
                .toList();
          }

          if (lavoratori.isEmpty) {
            return const Center(child: Text('NESSUN LAVORATORE TROVATO.'));
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: lavoratori.length,
            itemBuilder: (context, index) {
              final lav = lavoratori[index];
              final isSelected = _selectedIds.contains(lav.id);

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                  side: BorderSide(
                    color: isSelected
                        ? colorScheme.primary
                        : colorScheme.outline,
                    width: isSelected ? 3 : 1,
                  ),
                ),
                child: ListTile(
                  onLongPress: () => _toggleSelection(lav.id),
                  onTap: _isSelectionMode
                      ? () => _toggleSelection(lav.id)
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  View3A(lavoratoreId: lav.id),
                            ),
                          );
                        },
                  leading: _isSelectionMode
                      ? Checkbox(
                          value: isSelected,
                          onChanged: (_) => _toggleSelection(lav.id),
                        )
                      : Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: colorScheme.primary,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              lav.sesso,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                  title: Text(
                    '${lav.cognome.toUpperCase()} ${lav.nome.toUpperCase()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  subtitle: Text(
                    'CF: ${lav.codiceFiscale}\nAZIENDA ID: ${lav.aziendaId}',
                    style: const TextStyle(fontSize: 11, letterSpacing: 1.1),
                  ),
                  trailing: _isSelectionMode
                      ? null
                      : IconButton(
                          tooltip: "Dettagli Lavoratore",
                          icon: Icon(
                            Icons.edit_note,
                            color: colorScheme.primary,
                          ),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LavoratoriForm(
                                aziendaId: lav.aziendaId,
                                lavoratore: lav,
                              ),
                            ),
                          ),
                        ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: _isSelectionMode
          ? null
          : FloatingActionButton(
              tooltip: "Aggiungi Lavoratore",
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LavoratoriForm()),
              ),
              child: const Icon(Icons.person_add_alt_1),
            ),
    );
  }
}
