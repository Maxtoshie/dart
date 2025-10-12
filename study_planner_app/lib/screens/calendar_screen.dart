// lib/screens/calendar_screen.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:study_planner/screens/add_task_screen.dart';
import 'package:study_planner/services/task_service.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _currentMonth = DateTime.now();
  DateTime? _selectedDate;

  void _previousMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1, 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 1);
    });
  }

  List<DateTime> _getDaysInMonth() {
    final firstDayOfMonth = DateTime(
      _currentMonth.year,
      _currentMonth.month,
      1,
    );
    final daysInMonth = DateTime(
      _currentMonth.year,
      _currentMonth.month + 1,
      0,
    ).day;
    final firstWeekday = firstDayOfMonth.weekday;

    List<DateTime> days = [];
    // Add padding for previous month if needed
    for (int i = 1; i < firstWeekday; i++) {
      days.add(DateTime(0)); // Placeholder
    }
    for (int i = 1; i <= daysInMonth; i++) {
      days.add(DateTime(_currentMonth.year, _currentMonth.month, i));
    }
    return days;
  }

  @override
  Widget build(BuildContext context) {
    final days = _getDaysInMonth();

    return Scaffold(
      appBar: AppBar(
        title: Text(DateFormat.yMMMM().format(_currentMonth)),
        actions: [
          IconButton(
            onPressed: _previousMonth,
            icon: const Icon(Icons.arrow_left),
          ),
          IconButton(
            onPressed: _nextMonth,
            icon: const Icon(Icons.arrow_right),
          ),
        ],
      ),
      body: Column(
        children: [
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 7,
            children: [
              'Sun',
              'Mon',
              'Tue',
              'Wed',
              'Thu',
              'Fri',
              'Sat',
            ].map((day) => Center(child: Text(day))).toList(),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
              ),
              itemCount: days.length,
              itemBuilder: (context, index) {
                final day = days[index];
                if (day.year == 0) return const SizedBox.shrink();
                final hasTasks = TaskService.instance.hasTasksOnDate(day);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedDate = day;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: hasTasks ? Colors.blue[100] : null,
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Text('${day.day}'),
                  ),
                );
              },
            ),
          ),
          if (_selectedDate != null)
            Expanded(
              child: Column(
                children: [
                  Text('Tasks for ${DateFormat.yMd().format(_selectedDate!)}'),
                  Expanded(
                    child: ListView.builder(
                      itemCount: TaskService.instance
                          .getTasksForDate(_selectedDate!)
                          .length,
                      itemBuilder: (context, index) {
                        final task = TaskService.instance.getTasksForDate(
                          _selectedDate!,
                        )[index];
                        return ListTile(
                          title: Text(task.title),
                          subtitle: Text(task.description ?? ''),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AddTaskScreen(task: task),
                                    ),
                                  ).then((_) => setState(() {}));
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  TaskService.instance.deleteTask(task);
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaskScreen()),
          ).then((_) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
