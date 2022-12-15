import 'dart:developer';

import 'package:midi/midi.dart';
import 'device_state_holder.dart';

class DeviceManager {
  final DeviceStateHolder holder;

  DeviceManager({required this.holder});

  void onGetDevices() {
    if (holder.deviceState.isDeviceConnected) {
      onDisconnectDevice();
    }
    onSetDevice(null);
    try {
      List<AlsaMidiDevice> devices = AlsaMidiDevice.getDevices();
      log('Got ${devices.length} devices');
      holder.setDevices(devices);
    } catch (e, s) {
      log('Error: $e,\nStacktrace:$s');
    }
  }

  void onConnectDevice() async {
    await holder.deviceState.device!.connect();
    onSetStream(holder.deviceState.device!.receivedMessages);
    holder.deviceState.stream!.listen((event) {
      log(event.toString());
    });
  }

  void onSetDevice(AlsaMidiDevice? device) {
    holder.setDevice(device);
  }

  void onSetStream(Stream<MidiMessage>? stream) {
    holder.setStream(stream);
  }

  void onDisconnectDevice() {
    holder.deviceState.device!.disconnect();
  }
}
