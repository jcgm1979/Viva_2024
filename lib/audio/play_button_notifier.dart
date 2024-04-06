import 'package:flutter/foundation.dart';
//TODO: FILE ACTUALIZADO.
class PlayButtonNotifier extends ValueNotifier<ButtonState> {
  PlayButtonNotifier() : super(_initialValue);
  static const _initialValue = ButtonState.loading;
}

class PlayButtonPageNotifier extends ValueNotifier<ButtonPage> {
  PlayButtonPageNotifier() : super(_initialValue);
  static const _initialValue = ButtonPage.radio;
}

enum ButtonState {
  paused,
  playing,
  loading,
}

enum ButtonPage {
  radio,
  somosLibres,
}
