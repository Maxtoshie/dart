// lib/screens/settings_screen.dart
import 'package:flutter/material.dart';
import 'package:study_planner/services/task_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Enable Reminders'),
            value: TaskService.instance.remindersEnabled,
            onChanged: (value) {
              setState(() {
                TaskService.instance.remindersEnabled = value;
              });
            },
          ),
          ListTile(
            title: const Text('Storage Method'),
            subtitle: const Text('Using Shared Preferences'),
          ),
        ],
      ),
    );
  }
}
