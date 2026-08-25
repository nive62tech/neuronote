import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/task_model.dart';
import '../providers/task_provider.dart';
import '../services/api_service.dart';
import '../services/audio_service.dart';

class RecordScreen extends ConsumerStatefulWidget {
  const RecordScreen({super.key});

  @override
  ConsumerState<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends ConsumerState<RecordScreen> {
  final AudioService _audioService = AudioService();
  final ApiService _apiService = ApiService();

  bool _isRecording = false;
  bool _isProcessing = false;
  String _statusText = 'Tap to speak';

  Future<void> _toggleRecording() async {
    if (_isProcessing) return;

    if (_isRecording) {
      setState(() {
        _isRecording = false;
        _isProcessing = true;
        _statusText = 'Transcribing...';
      });

      final path = await _audioService.stopRecording();
      if (path == null) {
        setState(() {
          _isProcessing = false;
          _statusText = 'Recording failed. Tap to try again.';
        });
        return;
      }

      try {
        final text = await _apiService.transcribe(path);
        setState(() => _statusText = 'Extracting tasks...');

        final result = await _apiService.extractTasks(text);
        final tasksJson = result['tasks'] as List<dynamic>;

        for (final t in tasksJson) {
          await ref.read(taskListProvider.notifier).addTask(
                Task(
                  id: t['id'] as String,
                  title: t['title'] as String,
                  date: t['date'] as String?,
                  time: t['time'] as String?,
                  type: t['type'] as String? ?? 'other',
                ),
              );
        }

        setState(() {
          _isProcessing = false;
          _statusText = 'Heard: "$text"\n${tasksJson.length} task(s) added.';
        });
      } catch (e) {
        setState(() {
          _isProcessing = false;
          _statusText = 'Error: $e';
        });
      }
    } else {
      final hasPermission = await _audioService.hasPermission();
      if (!hasPermission) {
        setState(() => _statusText = 'Microphone permission denied.');
        return;
      }
      await _audioService.startRecording();
      setState(() {
        _isRecording = true;
        _statusText = 'Listening...';
      });
    }
  }

  @override
  void dispose() {
    _audioService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Record')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 96,
                icon: Icon(_isRecording ? Icons.stop_circle : Icons.mic_none),
                color: _isRecording ? Colors.red : null,
                onPressed: _isProcessing ? null : _toggleRecording,
              ),
              const SizedBox(height: 16),
              if (_isProcessing) const CircularProgressIndicator(),
              const SizedBox(height: 12),
              Text(_statusText, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
