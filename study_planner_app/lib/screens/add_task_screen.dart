// lib/screens/add_task_screen.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:study_planner/models/task.dart';
import 'package:study_planner/services/task_service.dart';

class AddTaskScreen extends StatefulWidget {
  final Task? task;
  const AddTaskScreen({super.key, this.task});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? _dueDate;
  DateTime? _reminderTime;

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      _titleController.text = widget.task!.title;
      _descriptionController.text = widget.task!.description ?? '';
      _dueDate = widget.task!.dueDate;
      _reminderTime = widget.task!.reminderTime;
    }
  }

  Future<void> _selectDueDate() async {
    final selected = await showDatePicker(
      context: context,
      initialDate: _dueDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (selected != null) {
      setState(() {
        _dueDate = selected;
      });
    }
  }

  Future<void> _selectReminderTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _reminderTime ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (date == null) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_reminderTime ?? DateTime.now()),
    );
    if (time == null) return;

    setState(() {
      _reminderTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  void _saveTask() {
    if (_titleController.text.isEmpty || _dueDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Title and due date are required')),
      );
      return;
    }

    final task = Task(
      title: _titleController.text,
      description: _descriptionController.text.isNotEmpty
          ? _descriptionController.text
          : null,
      dueDate: _dueDate!,
      reminderTime: _reminderTime,
    );

    if (widget.task != null) {
      TaskService.instance.updateTask(widget.task!, task);
    } else {
      TaskService.instance.addTask(task);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task != null ? 'Edit Task' : 'Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description (optional)',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('Due Date: '),
                Text(
                  _dueDate != null
                      ? DateFormat.yMd().format(_dueDate!)
                      : 'Not set',
                ),
                const Spacer(),
                TextButton(
                  onPressed: _selectDueDate,
                  child: const Text('Select'),
                ),
              ],
            ),
            Row(
              children: [
                const Text('Reminder: '),
                Text(
                  _reminderTime != null
                      ? DateFormat.yMd().add_jm().format(_reminderTime!)
                      : 'Not set',
                ),
                const Spacer(),
                TextButton(
                  onPressed: _selectReminderTime,
                  child: const Text('Select'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            ElevatedButton(onPressed: _saveTask, child: const Text('Save')),
          ],
        ),
      ),
    );
  }
}
