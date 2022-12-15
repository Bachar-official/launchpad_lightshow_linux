import 'dart:developer';
import 'package:midi/midi.dart';

import 'home_state.dart';
import 'home_stateholder.dart';

class HomeManager {
  final HomeStateHolder holder;

  HomeManager({required this.holder});

  void onSetPage(int page) {
    holder.setPage(page);
  }

  void onGetDevices() {
    holder.setIsLoading(true);
    if (holder.homeState.device.connected) {
      onDisconnectDevice();
    }
    onSetDevice(HomeState.mockDevice);
    try {
      List<AlsaMidiDevice> devices = AlsaMidiDevice.getDevices();
      if (devices.isEmpty) {
        devices = [HomeState.mockDevice];
      }
      log('Получено ${devices.length} устройств');
      holder.setDevices(devices);
    } catch (e, s) {
      log('Error: $e,\nStacktrace:$s');
    } finally {
      holder.setIsLoading(false);
    }
  }

  void onSetDevice(AlsaMidiDevice? device) {
    if (device != null) holder.setDevice(device);
  }

  void onConnectDevice() async {
    await holder.homeState.device.connect();
    holder.setStream(holder.homeState.device.receivedMessages);
    holder.homeState.stream.listen((event) {
      log(event.toString());
    });
  }

  void onDisconnectDevice() async {
    holder.homeState.device.disconnect();
  }
}
