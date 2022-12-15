import 'package:flutter/foundation.dart';
import 'package:launchpad_lightshow_flutter/entity/pad_color.dart';

class LightMessage {
  final int x;
  final int y;
  final PadColor padColor;

  LightMessage({required this.x, required this.y, required this.padColor});

  Uint8List getMessage() =>
      Uint8List.fromList([144, x * 10 + y, padColor.color]);
}
