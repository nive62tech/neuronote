import 'package:flutter/material.dart';

class RecordScreen extends StatelessWidget {
  const RecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Record')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 96,
              icon: const Icon(Icons.mic_none),
              onPressed: () {
                // Wired to actual recording in Phase 2.
              },
            ),
            const SizedBox(height: 12),
            const Text('Tap to speak (coming in Phase 2)'),
          ],
        ),
      ),
    );
  }
}
