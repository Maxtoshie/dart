// lib/models/task.dart

class Task {
  String title;
  String? description;
  DateTime dueDate;
  DateTime? reminderTime;

  Task({
    required this.title,
    this.description,
    required this.dueDate,
    this.reminderTime,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        title: json['title'] as String,
        description: json['description'] as String?,
        dueDate: DateTime.parse(json['dueDate'] as String),
        reminderTime: json['reminderTime'] != null
            ? DateTime.parse(json['reminderTime'] as String)
            : null,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'dueDate': dueDate.toIso8601String(),
        'reminderTime': reminderTime?.toIso8601String(),
      };
}
