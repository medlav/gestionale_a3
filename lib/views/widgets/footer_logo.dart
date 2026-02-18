// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (c) 2026 medlav.app

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget buildFooterLogo(BuildContext context) {
  final theme = Theme.of(context);
  final screenHeight = MediaQuery.of(context).size.height;

  return InkWell(
    onTap: () async {
      final Uri url = Uri.parse('https://medlav.app');

      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        debugPrint('Impossibile aprire l\'URL: $url');
      }
    },
    child: Container(
      width: double.infinity,
      height: screenHeight * 0.18,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          top: BorderSide(color: theme.colorScheme.primary, width: 6),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              border: Border.all(color: theme.colorScheme.onSurface, width: 3),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.onSurface,
                  offset: const Offset(6, 6),
                ),
              ],
            ),
            child: Text(
              'MEDLAV.APP',
              style: TextStyle(
                color: theme.colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 22,
                letterSpacing: 4,
              ),
            ),
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.language, size: 16, color: theme.colorScheme.primary),
              const SizedBox(width: 8),
              Text(
                'WWW.MEDLAV.APP',
                style: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w900,
                  fontSize: 14,
                  letterSpacing: 2,
                  decorationColor: theme.colorScheme.primary,
                  decorationThickness: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
