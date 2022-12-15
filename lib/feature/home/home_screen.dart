import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:midi/midi.dart';

import '../../app/di.dart';
import 'home_state.dart';
import 'home_stateholder.dart';

final homeScreenProvider = StateNotifierProvider<HomeStateHolder, HomeState>(
    (ref) => di.homeStateHolder);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = di.homeManager;
    final state = ref.watch(homeScreenProvider);

    return state.isLoading
        ? const CircularProgressIndicator()
        : Scaffold(
            appBar:
                AppBar(title: const Text('Novation Launchpad Lightshow maker')),
            body: Center(
                child: Column(
              children: [
                DropdownButton<AlsaMidiDevice>(
                    hint: const Text('Choose device'),
                    value: state.device,
                    items: state.devices
                        .map((device) => DropdownMenuItem(
                            value: device, child: Text(device.name)))
                        .toList(),
                    onChanged: manager.onSetDevice),
                ElevatedButton(
                    onPressed: () => manager.onGetDevices(),
                    child: const Text('Refresh device list')),
                ElevatedButton(
                    onPressed: state.device.name == 'Empty'
                        ? null
                        : state.isDeviceConnected
                            ? manager.onDisconnectDevice
                            : manager.onConnectDevice,
                    child: Text(
                        state.isDeviceConnected ? 'Disconnect' : 'Connect'))
              ],
            )),
          );
  }
}
