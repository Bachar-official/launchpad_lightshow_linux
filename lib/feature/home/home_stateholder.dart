import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_state.dart';

class HomeStateHolder extends StateNotifier<HomeState> {
  HomeStateHolder() : super(HomeState.initial());

  HomeState get homeState => state;

  void setPage(int page) {
    state = state.copyWith(page: page);
  }
}
