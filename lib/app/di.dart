import 'dart:developer';

import '../feature/home/home_manager.dart';
import '../feature/home/home_stateholder.dart';

class DI {
  late final HomeStateHolder homeStateHolder;
  late final HomeManager homeManager;

  DI() {
    homeStateHolder = HomeStateHolder();
    homeManager = HomeManager(holder: homeStateHolder);
  }

  void init() {
    log('Dependency Injection initialized');
    homeManager.onGetDevices();
  }
}

final di = DI();
