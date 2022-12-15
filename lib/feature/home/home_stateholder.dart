import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:midi/midi.dart';

import 'home_state.dart';

class HomeStateHolder extends StateNotifier<HomeState> {
  HomeStateHolder() : super(HomeState.initial());

  HomeState get homeState => state;

  void setPage(int page) {
    state = state.copyWith(page: page);
  }

  void setDevices(List<AlsaMidiDevice> devices) {
    state = state.copyWith(devices: devices);
  }

  void setIsLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void setDevice(AlsaMidiDevice device) {
    state = state.copyWith(device: device);
  }

  void setStream(Stream<MidiMessage> stream) {
    state = state.copyWith(stream: stream);
  }
}
