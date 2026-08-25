class Task {
  final String id;
  final String title;
  final String? date; // YYYY-MM-DD
  final String? time; // HH:MM
  final String type;  // exam, meeting, deadline, other

  const Task({
    required this.id,
    required this.title,
    this.date,
    this.time,
    this.type = 'other',
  });

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String,
      title: map['title'] as String,
      date: map['date'] as String?,
      time: map['time'] as String?,
      type: map['type'] as String? ?? 'other',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'time': time,
      'type': type,
    };
  }
}
