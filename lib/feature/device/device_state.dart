import 'package:flutter/material.dart';
import 'package:midi/midi.dart';

@immutable
class DeviceState {
  final List<AlsaMidiDevice> devices;
  final AlsaMidiDevice? device;
  final Stream<MidiMessage>? stream;

  bool get isDeviceConnected => _isDeviceConnected();

  const DeviceState(
      {required this.devices, required this.device, required this.stream});

  DeviceState.initial()
      : devices = [],
        device = null,
        stream = null;

  DeviceState copyWith(
          {bool devNull = false,
          List<AlsaMidiDevice>? devices,
          AlsaMidiDevice? device,
          Stream<MidiMessage>? stream}) =>
      DeviceState(
        devices: devices ?? this.devices,
        device: devNull ? null : device ?? this.device,
        stream: devNull ? null : stream ?? this.stream,
      );

  bool _isDeviceConnected() {
    if (device != null) {
      return device!.connected;
    }
    return false;
  }
}
