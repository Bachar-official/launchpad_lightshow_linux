import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'app/di.dart';

void main() {
  di.init();
  runApp(const ProviderScope(child: App()));
}
