import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/task_provider.dart';

class TaskListScreen extends ConsumerWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(taskListProvider.notifier).loadTasks(),
          ),
        ],
      ),
      body: tasks.isEmpty
          ? const Center(
              child: Text('No tasks yet. Record a voice note to add one.'))
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return ListTile(
                  leading: const Icon(Icons.task_alt),
                  title: Text(task.title),
                  subtitle: Text(
                    '${task.type} · ${task.date ?? "no date"} ${task.time ?? ""}',
                  ),
                );
              },
            ),
    );
  }
}
