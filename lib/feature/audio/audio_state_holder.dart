import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:midi/midi.dart';
import 'audio_state.dart';

class AudioStateHolder extends StateNotifier<AudioState> {
  AudioStateHolder() : super(const AudioState.initial());

  AudioState get audioState => state;

  void setSurfaceNumber(int surfaceNumber) {
    state = state.copyWith(surfaceNumber: surfaceNumber);
  }

  void setStream(Stream<MidiMessage>? stream) {
    if (stream != null) {
      state = state.copyWith(stream: stream);
    } else {
      state = state.copyWith(stream: stream, devNull: true);
    }
  }
}
