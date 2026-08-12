import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Tracks which bottom-nav tab is selected.
final selectedTabProvider = StateProvider<int>((ref) => 0);
