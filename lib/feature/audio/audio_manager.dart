import 'package:midi/midi.dart';

import 'audio_state_holder.dart';

class AudioManager {
  final AudioStateHolder holder;

  AudioManager({required this.holder});

  bool _isManagingEvent(MidiMessage message) {
    return message.data.elementAt(1) % 10 == 9;
  }

  int _getSurfaceNumber(MidiMessage message) {
    return (message.data.elementAt(1) / 10).floor();
  }

  void onSetStream(Stream<MidiMessage>? stream) {
    holder.setStream(stream);
    if (holder.audioState.stream != null) {
      holder.audioState.stream!.listen((event) {
        if (_isManagingEvent(event)) {
          onSetSurface(_getSurfaceNumber(event));
        }
      });
    }
  }

  void onSetSurface(int surface) {
    holder.setSurfaceNumber(surface);
  }
}
