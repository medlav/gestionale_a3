// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (c) 2026 medlav.app

import 'package:flutter/material.dart';
import 'package:gestionale_a3/version.dart';
import 'package:gestionale_a3/views/widgets/my_appbar.dart' show CustomAppBar;
import 'package:url_launcher/url_launcher.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  final String currentVersion = "$CURRENT_VERSION-pre-alpha";
  final String repoUrl = "https://github.com/medlav/gestionale_a3";

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    try {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } catch (e) {
      debugPrint('Errore nel lancio dell\'URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppBar(title: 'INFO APP'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'GESTIONALE A3',
              style: theme.textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'VERSIONE: $currentVersion',
              style: theme.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),

            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 20),

            Text(
              'FINALITÀ DEL PROGETTO',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Sperimentazione tecnica sui flussi dati D.Lgs. 81/08 (Allegati 3A e 3B) '
              'e architetture EHR locali. Sviluppato per testare la generazione di '
              'report XML ministeriali senza intermediari cloud.',
              style: theme.textTheme.bodyMedium,
            ),

            const SizedBox(height: 30),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: theme.colorScheme.error,
                border: Border.all(
                  color: theme.colorScheme.onSurface,
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.onSurface,
                    offset: const Offset(6, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DISCLAIMER / LICENZA GPL V2',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onError,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Software distribuito sotto licenza GPL v2. Questo è un esperimento di "build in public". '
                    'L\'applicazione è in stato pre-alpha, soggetta a bug critici e modifiche strutturali. '
                    'L\'autore non si assume alcuna responsabilità per l\'accuratezza dei dati generati '
                    'o per l\'uso improprio in contesti professionali.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onError,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            _buildInfoTile(
              context,
              icon: Icons.code,
              label: 'CODICE SORGENTE (GITHUB)',
              onTap: () => _launchUrl(repoUrl),
            ),
            const Divider(thickness: 1, height: 1),
            _buildInfoTile(
              context,
              icon: Icons.language,
              label: 'VISITA MEDLAV.APP',
              onTap: () => _launchUrl('https://medlav.app'),
            ),
            // const Divider(thickness: 1, height: 1),
            // _buildInfoTile(
            //   context,
            //   icon: Icons.security,
            //   label: 'PRIVACY POLICY',
            //   onTap: () {},
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      leading: Icon(icon, color: theme.colorScheme.primary, size: 28),
      title: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
