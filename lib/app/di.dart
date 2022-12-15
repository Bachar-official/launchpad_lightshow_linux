import 'dart:developer';

import 'package:launchpad_lightshow_flutter/feature/device/device_manager.dart';
import 'package:launchpad_lightshow_flutter/feature/device/device_state_holder.dart';

import '../feature/home/home_manager.dart';
import '../feature/home/home_stateholder.dart';

class DI {
  late final HomeStateHolder homeStateHolder;
  late final DeviceStateHolder deviceStateHolder;
  late final HomeManager homeManager;
  late final DeviceManager deviceManager;

  DI() {
    homeStateHolder = HomeStateHolder();
    homeManager = HomeManager(holder: homeStateHolder);
    deviceStateHolder = DeviceStateHolder();
    deviceManager = DeviceManager(holder: deviceStateHolder);
  }

  void init() {
    log('Dependency Injection initialized');
    deviceManager.onGetDevices();
  }
}

final di = DI();
