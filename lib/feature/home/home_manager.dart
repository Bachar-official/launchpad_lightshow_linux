import 'home_stateholder.dart';

class HomeManager {
  final HomeStateHolder holder;

  HomeManager({required this.holder});

  void onSetPage(int page) {
    holder.setPage(page);
  }
}
