import 'package:flutter/material.dart';
import 'package:midi/midi.dart';

@immutable
class AudioState {
  final int surfaceNumber;
  final Stream<MidiMessage>? stream;

  const AudioState({required this.surfaceNumber, required this.stream});

  const AudioState.initial()
      : surfaceNumber = 1,
        stream = null;

  AudioState copyWith(
          {int? surfaceNumber,
          Stream<MidiMessage>? stream,
          bool devNull = false}) =>
      AudioState(
          surfaceNumber: surfaceNumber ?? this.surfaceNumber,
          stream: devNull ? null : stream ?? this.stream);
}
