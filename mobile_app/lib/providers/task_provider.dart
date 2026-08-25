import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/task_model.dart';
import '../services/db_service.dart';

class TaskListNotifier extends StateNotifier<List<Task>> {
  TaskListNotifier() : super([]) {
    loadTasks();
  }

  Future<void> loadTasks() async {
    final rows = await DBService.getTasks();
    state = rows.map((row) => Task.fromMap(row)).toList();
  }

  Future<void> addTask(Task task) async {
    await DBService.insertTask(task.toMap());
    await loadTasks();
  }
}

final taskListProvider = StateNotifierProvider<TaskListNotifier, List<Task>>(
  (ref) => TaskListNotifier(),
);
