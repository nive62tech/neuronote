class Task {
  final String id;
  final String title;
  final DateTime deadline;
  final String type; // exam, meeting, deadline, other

  const Task({
    required this.id,
    required this.title,
    required this.deadline,
    required this.type,
  });
}

// Dummy data for Phase 1 UI only -- replaced by real storage in Phase 4.
final List<Task> dummyTasks = [
  Task(
    id: '1',
    title: 'Math test',
    deadline: DateTime.now().add(const Duration(days: 1)),
    type: 'exam',
  ),
  Task(
    id: '2',
    title: 'Team standup',
    deadline: DateTime.now().add(const Duration(hours: 3)),
    type: 'meeting',
  ),
  Task(
    id: '3',
    title: 'Project report submission',
    deadline: DateTime.now().add(const Duration(days: 4)),
    type: 'deadline',
  ),
];
