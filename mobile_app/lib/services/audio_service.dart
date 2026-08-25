import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';

class AudioService {
  final AudioRecorder _recorder = AudioRecorder();
  String? _currentPath;

  Future<bool> hasPermission() => _recorder.hasPermission();

  Future<void> startRecording() async {
    final dir = await getTemporaryDirectory();
    _currentPath =
        '${dir.path}/neuronote_${DateTime.now().millisecondsSinceEpoch}.wav';

    await _recorder.start(
      const RecordConfig(encoder: AudioEncoder.wav),
      path: _currentPath!,
    );
  }

  Future<String?> stopRecording() async {
    final path = await _recorder.stop();
    return path ?? _currentPath;
  }

  Future<bool> isRecording() => _recorder.isRecording();

  void dispose() {
    _recorder.dispose();
  }
}
