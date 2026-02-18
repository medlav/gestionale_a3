// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (c) 2026 medlav.app

import 'package:flutter/material.dart';
import 'package:gestionale_a3/views/azienda_details.dart';
import 'package:gestionale_a3/views/azienda_form.dart' show AziendeForm;
import 'package:provider/provider.dart';
import 'package:gestionale_a3/data/database.dart';

class AziendeListView extends StatefulWidget {
  const AziendeListView({super.key});

  @override
  State<AziendeListView> createState() => _AziendeListViewState();
}

class _AziendeListViewState extends State<AziendeListView> {
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
        title: const Text('Elimina Aziende'),
        content: Text(
          'Eliminare ${_selectedIds.length} aziende? Attenzione: se ci sono lavoratori legati a queste aziende, l\'operazione potrebbe fallire.',
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
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await (db.delete(db.aziende)..where((t) => t.id.isIn(_selectedIds))).go();
      setState(() {
        _selectedIds.clear();
        _isSelectionMode = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _isSelectionMode ? '${_selectedIds.length} SELEZIONATE' : 'AZIENDA',
        ),
        actions: [
          if (_isSelectionMode)
            IconButton(
              icon: Icon(Icons.delete, color: theme.colorScheme.error),
              onPressed: () => _deleteSelected(db),
            ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cerca azienda...',
                prefixIcon: const Icon(Icons.search),
                fillColor: theme.colorScheme.surface,
                filled: true,
                border: const OutlineInputBorder(),
              ),
              onChanged: (val) =>
                  setState(() => _searchQuery = val.toLowerCase()),
            ),
          ),
        ),
      ),
      body: StreamBuilder<List<Azienda>>(
        stream: db.select(db.aziende).watch(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          var aziende = snapshot.data!;
          if (_searchQuery.isNotEmpty) {
            aziende = aziende
                .where(
                  (a) => a.ragioneSociale.toLowerCase().contains(_searchQuery),
                )
                .toList();
          }

          if (aziende.isEmpty) {
            return const Center(child: Text('Nessuna azienda trovata.'));
          }

          return ListView.builder(
            itemCount: aziende.length,
            itemBuilder: (context, index) {
              final az = aziende[index];
              final isSelected = _selectedIds.contains(az.id);

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                elevation: isSelected ? 4 : 1,
                shape: RoundedRectangleBorder(
                  side: isSelected
                      ? BorderSide(color: theme.colorScheme.primary, width: 2)
                      : BorderSide.none,
                ),
                child: ListTile(
                  onLongPress: () => _toggleSelection(az.id),
                  onTap: _isSelectionMode
                      ? () => _toggleSelection(az.id)
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AziendaDetails(aziendaId: az.id),
                            ),
                          );
                        },
                  leading: _isSelectionMode
                      ? Checkbox(
                          value: isSelected,
                          onChanged: (_) => _toggleSelection(az.id),
                        )
                      : CircleAvatar(
                          backgroundColor: theme.colorScheme.primary,
                          child: Icon(
                            Icons.business,
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                  title: Text(
                    az.ragioneSociale,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('P.IVA: ${az.partitaIvaCf}'),
                  trailing: _isSelectionMode
                      ? null
                      : IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AziendeForm(azienda: az),
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
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AziendeForm()),
              ),
              child: const Icon(Icons.add_business),
            ),
    );
  }
}
