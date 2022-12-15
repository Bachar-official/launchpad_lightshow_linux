import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:launchpad_lightshow_flutter/feature/audio/audio_screen.dart';
import 'package:launchpad_lightshow_flutter/feature/device/device_screen.dart';

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

    return Scaffold(
        bottomNavigationBar: NavigationBar(
          selectedIndex: state.page,
          onDestinationSelected: manager.onSetPage,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.usb), label: 'Device'),
            NavigationDestination(icon: Icon(Icons.music_note), label: 'MIDI'),
            NavigationDestination(icon: Icon(Icons.audio_file), label: 'Audio')
          ],
        ),
        body: <Widget>[
          const DeviceScreen(),
          Container(),
          const AudioScreen()
        ][state.page]);
  }
}
