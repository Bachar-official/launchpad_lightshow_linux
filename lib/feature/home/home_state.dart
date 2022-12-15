import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:midi/midi.dart';

@immutable
class HomeState {
  final int page;
  final List<AlsaMidiDevice> devices;
  final bool isLoading;
  final AlsaMidiDevice device;
  final Stream<MidiMessage> stream;

  static AlsaMidiDevice mockDevice = AlsaMidiDevice(
      Pointer.fromAddress(0), 0, 0, 'Empty', '', StreamController());

  bool get isDeviceConnected => device.connected;

  const HomeState({
    required this.page,
    required this.devices,
    required this.isLoading,
    required this.device,
    required this.stream,
  });

  HomeState.initial()
      : page = 0,
        devices = [mockDevice],
        isLoading = false,
        device = mockDevice,
        stream = StreamController<MidiMessage>().stream;

  HomeState copyWith(
          {int? page,
          List<AlsaMidiDevice>? devices,
          bool? isLoading,
          AlsaMidiDevice? device,
          Stream<MidiMessage>? stream}) =>
      HomeState(
          devices: devices ?? this.devices,
          page: page ?? this.page,
          isLoading: isLoading ?? this.isLoading,
          device: device ?? this.device,
          stream: stream ?? this.stream);
}
