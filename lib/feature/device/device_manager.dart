import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:launchpad_lightshow_flutter/entity/light_message.dart';
import 'package:launchpad_lightshow_flutter/entity/pad_color.dart';
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

  void sendOKConnectedSignal(AlsaMidiDevice device) {
    device
      ..send(LightMessage(x: 4, y: 5, padColor: PadColor.aquamarine100)
          .getMessage())
      ..send(LightMessage(x: 5, y: 5, padColor: PadColor.aquamarine100)
          .getMessage())
      ..send(LightMessage(x: 4, y: 4, padColor: PadColor.aquamarine100)
          .getMessage())
      ..send(LightMessage(x: 5, y: 4, padColor: PadColor.aquamarine100)
          .getMessage());
    Future.delayed(const Duration(milliseconds: 500), () {
      device
        ..send(LightMessage(x: 4, y: 5, padColor: PadColor.off).getMessage())
        ..send(LightMessage(x: 5, y: 5, padColor: PadColor.off).getMessage())
        ..send(LightMessage(x: 4, y: 4, padColor: PadColor.off).getMessage())
        ..send(LightMessage(x: 5, y: 4, padColor: PadColor.off).getMessage());
    });
  }

  void onConnectDevice() async {
    await holder.deviceState.device!.connect();
    onSetStream(holder.deviceState.device!.receivedMessages);
    log('Device ${holder.deviceState.device!.name} connected!');
    sendOKConnectedSignal(holder.deviceState.device!);
  }

  void onSetDevice(AlsaMidiDevice? device) {
    holder.setDevice(device);
  }

  void onSetStream(Stream<MidiMessage>? stream) {
    holder.setStream(stream);
  }

  void onDisconnectDevice() {
    holder.deviceState.device!.disconnect();
    onSetStream(null);
    onSetDevice(null);
    log('Device disconnected!');
  }
}
