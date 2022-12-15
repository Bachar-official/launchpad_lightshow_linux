import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:launchpad_lightshow_flutter/app/di.dart';
import 'package:launchpad_lightshow_flutter/feature/audio/audio_state.dart';
import 'package:launchpad_lightshow_flutter/feature/audio/audio_state_holder.dart';

final audioProvider = StateNotifierProvider<AudioStateHolder, AudioState>(
    (ref) => di.audioStateHolder);

class AudioScreen extends ConsumerWidget {
  const AudioScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = di.audioManager;
    final state = ref.watch(audioProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Audio')),
      body: state.stream == null
          ? const Center(
              child: Text('Device not connected'),
            )
          : Center(child: Text('surface: ${state.surfaceNumber}')),
    );
  }
}
