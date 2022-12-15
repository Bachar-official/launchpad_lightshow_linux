import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:midi/midi.dart';

import 'device_state.dart';

class DeviceStateHolder extends StateNotifier<DeviceState> {
  DeviceStateHolder() : super(DeviceState.initial());

  DeviceState get deviceState => state;

  void setDevices(List<AlsaMidiDevice> devices) {
    state = state.copyWith(devices: devices);
  }

  void setDevice(AlsaMidiDevice? device) {
    if (device == null) {
      state = state.copyWith(devNull: true, device: device);
    } else {
      state = state.copyWith(device: device);
    }
  }

  void setStream(Stream<MidiMessage>? stream) {
    if (stream == null) {
      state = state.copyWith(stream: stream, devNull: true);
    } else {
      state = state.copyWith(stream: stream);
    }
  }
}
