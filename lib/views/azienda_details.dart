// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (c) 2026 medlav.app

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/database.dart';
import 'widgets/my_appbar.dart';

class AziendaDetails extends StatelessWidget {
  final int aziendaId;

  const AziendaDetails({super.key, required this.aziendaId});

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const CustomAppBar(title: 'DETTAGLI AZIENDA'),
      body: StreamBuilder<Azienda>(
        stream: database.getAziendaById(
          aziendaId,
        ), // Assicurati di avere questo getter nel database.dart
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('AZIENDA NON TROVATA'));
          }

          final az = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // BLOCCO ANAGRAFICA
                _buildSectionHeader(theme, 'ANAGRAFICA GENERALE'),
                _buildInfoCard(theme, {
                  'RAGIONE SOCIALE': az.ragioneSociale,
                  'P.IVA / CF': az.partitaIvaCf,
                  'CF SOCIETÀ': az.codiceFiscaleSocieta,
                  'ATECO': az.codiceAteco,
                }),

                const SizedBox(height: 20),

                // BLOCCO SEDI
                _buildSectionHeader(theme, 'SEDI E UNITÀ PRODUTTIVE'),
                _buildInfoCard(theme, {
                  'SEDE LEGALE': az.indirizzoSedeLegale,
                  'U. PRODUTTIVA': az.denominazioneUnitaProduttiva,
                  'INDIRIZZO U.P.': az.indirizzoUnitaProduttiva,
                }),

                const SizedBox(height: 20),

                // BLOCCO ALLEGATO 3B (DATI OCCUPAZIONALI)
                _buildSectionHeader(theme, 'DATI OCCUPAZIONALI (ALLEGATO 3B)'),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: theme.colorScheme.onSurface,
                      width: 2,
                    ),
                  ),
                  child: Table(
                    border: TableBorder.symmetric(
                      inside: BorderSide(color: theme.colorScheme.onSurface),
                    ),
                    children: [
                      _buildTableRow(
                        'RILEVAZIONE',
                        'MASCHI',
                        'FEMMINE',
                        isHeader: true,
                      ),
                      _buildTableRow(
                        'AL 30/06',
                        az.occupati3006Maschi.toString(),
                        az.occupati3006Femmine.toString(),
                      ),
                      _buildTableRow(
                        'AL 31/12',
                        az.occupati3112Maschi.toString(),
                        az.occupati3112Femmine.toString(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(ThemeData theme, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: theme.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildInfoCard(ThemeData theme, Map<String, String> data) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border.all(color: theme.colorScheme.onSurface, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: data.entries.map((e) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: RichText(
              text: TextSpan(
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
                children: [
                  TextSpan(
                    text: '${e.key}: ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: e.value),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  TableRow _buildTableRow(
    String c1,
    String c2,
    String c3, {
    bool isHeader = false,
  }) {
    final style = TextStyle(
      fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
      fontSize: 12,
    );
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(c1, style: style),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(c2, style: style, textAlign: TextAlign.center),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(c3, style: style, textAlign: TextAlign.center),
        ),
      ],
    );
  }
}
