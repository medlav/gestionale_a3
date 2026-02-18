// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (c) 2026 medlav.app

// cartelle_list_view.dart

import 'package:flutter/material.dart';
import 'package:gestionale_a3/data/database.dart' show AppDatabase, Lavoratore;
import 'package:gestionale_a3/views/lavoratore_form.dart';
import 'package:gestionale_a3/views/view_3a.dart';
import 'package:provider/provider.dart';
import 'package:gestionale_a3/views/widgets/my_appbar.dart';

class CartelleListView extends StatelessWidget {
  const CartelleListView({super.key});

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const CustomAppBar(title: '3A - CARTELLE SANITARIE'),
      body: StreamBuilder<List<Lavoratore>>(
        stream: db.select(db.lavoratori).watch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final lavoratori = snapshot.data ?? [];
          if (lavoratori.isEmpty) {
            return const Center(
              child: Text(
                'NESSUN LAVORATORE IN ARCHIVIO.',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          }

          return ListView.separated(
            itemCount: lavoratori.length,
            separatorBuilder: (context, index) => Divider(
              height: 1,
              color: colorScheme.outline.withValues(alpha: 0.5),
            ),
            itemBuilder: (context, index) {
              final lav = lavoratori[index];
              return ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: colorScheme.primary, width: 2),
                    color: colorScheme.surface,
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
                  '${lav.cognome} ${lav.nome}'.toUpperCase(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'CF: ${lav.codiceFiscale}',
                  style: const TextStyle(fontSize: 12, letterSpacing: 1.1),
                ),
                trailing: Icon(
                  Icons.medical_services_outlined,
                  color: colorScheme.primary,
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => View3A(lavoratoreId: lav.id),
                  ),
                ),
                onLongPress: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LavoratoriForm(
                      aziendaId: lav.aziendaId,
                      lavoratore: lav,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
