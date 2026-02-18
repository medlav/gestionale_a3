// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (c) 2026 medlav.app

// main.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gestionale_a3/providers/theme_provider.dart' show ThemeProvider;
import 'package:provider/provider.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'package:gestionale_a3/data/database.dart';
import 'package:gestionale_a3/theme.dart';
import 'package:gestionale_a3/views/homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        Provider<AppDatabase>(
          create: (context) => AppDatabase(_openConnection()),
          dispose: (context, db) => db.close(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: const GestionaleA3(),
    ),
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'gestionale_a3.sqlite'));
    return NativeDatabase(file);
  });
}

class GestionaleA3 extends StatelessWidget {
  const GestionaleA3({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Gestionale Medico A3',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeProvider.mode,
      home: const HomePage(),
    );
  }
}
