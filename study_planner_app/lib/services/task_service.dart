// lib/services/task_service.dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_planner/models/task.dart';

class TaskService {
  static TaskService? _instance;

  static TaskService get instance {
    _instance ??= TaskService._();
    return _instance!;
  }

  TaskService._();

  List<Task> _tasks = [];
  bool _remindersEnabled = true;

  List<Task> get tasks => _tasks;
  bool get remindersEnabled => _remindersEnabled;
  set remindersEnabled(bool value) {
    _remindersEnabled = value;
    _saveSettings();
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? tasksJson = prefs.getString('tasks');
    if (tasksJson != null) {
      final List<dynamic> tasksList = jsonDecode(tasksJson);
      _tasks = tasksList.map((json) => Task.fromJson(json)).toList();
    }
    _remindersEnabled = prefs.getBool('remindersEnabled') ?? true;
  }

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('remindersEnabled', _remindersEnabled);
  }

  Future<void> saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String tasksJson = jsonEncode(
      _tasks.map((task) => task.toJson()).toList(),
    );
    await prefs.setString('tasks', tasksJson);
  }

  void addTask(Task task) {
    _tasks.add(task);
    saveTasks();
  }

  void updateTask(Task oldTask, Task newTask) {
    final index = _tasks.indexOf(oldTask);
    if (index != -1) {
      _tasks[index] = newTask;
      saveTasks();
    }
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    saveTasks();
  }

  List<Task> getTasksForDate(DateTime date) {
    return _tasks.where((task) => _isSameDay(task.dueDate, date)).toList();
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  bool hasTasksOnDate(DateTime date) {
    return getTasksForDate(date).isNotEmpty;
  }

  void checkReminders(BuildContext context) {
    if (!_remindersEnabled) return;
    final now = DateTime.now();
    for (var task in List<Task>.from(_tasks)) {
      // Copy to avoid modification during iteration
      if (task.reminderTime != null && task.reminderTime!.isBefore(now)) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Reminder'),
            content: Text('Reminder for task: ${task.title}'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
        task.reminderTime = null; // Clear reminder after showing
        saveTasks();
      }
    }
  }
}
