// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (c) 2026 medlav.app

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final String? info;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.info,
  });

  void _showInfoDialog(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Row(
          children: [
            Icon(Icons.info_outline, color: Colors.blue),
            SizedBox(width: 10),
            Text("Info"),
          ],
        ),
        content: Text(text),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title.toUpperCase()),
      leading: leading,
      actions: [
        if (actions != null) ...actions!,
        if (info != null)
          IconButton(
            onPressed: () => _showInfoDialog(context, info!),
            icon: const Icon(Icons.info_outline, color: Colors.white),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 4);
}
