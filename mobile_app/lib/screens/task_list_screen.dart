import 'package:flutter/material.dart';
import '../models/task_model.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tasks')),
      body: ListView.builder(
        itemCount: dummyTasks.length,
        itemBuilder: (context, index) {
          final task = dummyTasks[index];
          return ListTile(
            leading: const Icon(Icons.task_alt),
            title: Text(task.title),
            subtitle: Text('${task.type} . ${task.deadline}'),
          );
        },
      ),
    );
  }
}
