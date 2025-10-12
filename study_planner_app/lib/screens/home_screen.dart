// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:study_planner/screens/today_screen.dart';
import 'package:study_planner/screens/calendar_screen.dart';
import 'package:study_planner/screens/settings_screen.dart';
import 'package:study_planner/services/task_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    TaskService.instance.loadData().then((_) {
      if (TaskService.instance.remindersEnabled) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          TaskService.instance.checkReminders(context);
        });
      }
    });
    _screens = [
      const TodayScreen(),
      const CalendarScreen(),
      const SettingsScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.today), label: 'Today'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
