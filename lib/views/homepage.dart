// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (c) 2026 medlav.app

import 'package:flutter/material.dart';
import 'package:gestionale_a3/providers/theme_provider.dart' show ThemeProvider;
import 'package:gestionale_a3/views/azienda_form.dart' show AziendeForm;
import 'package:gestionale_a3/views/info_view.dart' show InfoView;
import 'package:gestionale_a3/views/lavoratore_form.dart' show LavoratoriForm;
import 'package:gestionale_a3/views/lavoratori_list_view.dart'
    show LavoratoriListView;
import 'package:gestionale_a3/views/cartelle_list_view.dart';
import 'package:gestionale_a3/views/view_3b.dart';
import 'package:gestionale_a3/views/aziende_list_view.dart';
import 'package:gestionale_a3/views/widgets/my_appbar.dart';
import 'package:gestionale_a3/views/widgets/footer_logo.dart'
    show buildFooterLogo;
import 'package:provider/provider.dart' show Provider;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProv = Provider.of<ThemeProvider>(context);
    final isDark = themeProv.mode == ThemeMode.dark;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'GESTIONALE A3',
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InfoView()),
            );
          },
          icon: Icon(Icons.info_outline, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => themeProv.toggleTheme(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.0,
                maxCrossAxisExtent: 230,
              ),
              delegate: SliverChildListDelegate([
                _MenuCard(
                  title: 'Allegato 3A',
                  subtitle: 'Cartella Sanitarie',
                  icon: Icons.assignment_ind,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartelleListView(),
                    ),
                  ),
                ),
                _MenuCard(
                  title: 'Allegato 3B',
                  subtitle: 'Flussi INAIL',
                  icon: Icons.assessment,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const View3B()),
                  ),
                ),
                _MenuCard(
                  title: 'Aziende',
                  subtitle: 'Anagrafica',
                  icon: Icons.business,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AziendeListView(),
                    ),
                  ),
                ),
                _MenuCard(
                  title: 'Lavoratori',
                  subtitle: 'Database Personale',
                  icon: Icons.people_alt,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LavoratoriListView(),
                    ),
                  ),
                ),
                _MenuCard(
                  title: 'Nuova Azienda',
                  subtitle: 'Inserimento',
                  icon: Icons.add_business,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AziendeForm(),
                    ),
                  ),
                ),
                _MenuCard(
                  title: 'Nuovo Lavoratore',
                  subtitle: 'Inserimento',
                  icon: Icons.person_add_alt_1,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LavoratoriForm(),
                    ),
                  ),
                ),
                _MenuCard(
                  title: 'Info',
                  subtitle: 'Info Applicazione',
                  icon: Icons.info_outline_rounded,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const InfoView()),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildFooterLogo(context),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const _MenuCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.zero,
      child: Card(
        elevation: 0,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: colorScheme.outline, width: 2),
        ),
        color: colorScheme.surface,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: colorScheme.primary),
            const SizedBox(height: 12),
            Text(
              title.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                color: colorScheme.onSurface.withValues(alpha: 0.7),
                letterSpacing: 1.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
