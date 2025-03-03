import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final VoidCallback toggleTheme;

  SettingsScreen({required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Center(
        child: SwitchListTile(
          title: Text("Enable Dark Mode"),
          value: Theme.of(context).brightness == Brightness.dark,
          onChanged: (value) => toggleTheme(),
        ),
      ),
    );
  }
}
