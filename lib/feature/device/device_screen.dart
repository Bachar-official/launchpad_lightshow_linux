import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:launchpad_lightshow_flutter/app/di.dart';
import 'package:launchpad_lightshow_flutter/feature/device/device_state.dart';
import 'package:launchpad_lightshow_flutter/feature/device/device_state_holder.dart';
import 'package:midi/midi.dart';

final deviceStateProvider =
    StateNotifierProvider<DeviceStateHolder, DeviceState>(
        (ref) => di.deviceStateHolder);

class DeviceScreen extends ConsumerWidget {
  const DeviceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = di.deviceManager;
    final state = ref.watch(deviceStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configure device'),
        actions: [
          IconButton(
              icon: const Icon(Icons.refresh), onPressed: manager.onGetDevices),
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton<AlsaMidiDevice>(
              hint: const Text('Choose device'),
              value: state.device,
              items: state.devices
                  .map((device) =>
                      DropdownMenuItem(value: device, child: Text(device.name)))
                  .toList(),
              onChanged: manager.onSetDevice),
          ElevatedButton(
              onPressed: state.device == null
                  ? null
                  : state.isDeviceConnected
                      ? manager.onDisconnectDevice
                      : manager.onConnectDevice,
              child: Text(state.isDeviceConnected ? 'Disconnect' : 'Connect'))
        ],
      )),
    );
  }
}
