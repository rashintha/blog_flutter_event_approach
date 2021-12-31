import 'package:flutter_event_approach/utils/barrell.dart';

class ScreenHandlerState {
  final Screens screen;
  final Screens? previousScreen;

  ScreenHandlerState({required this.screen, this.previousScreen});

  factory ScreenHandlerState.loginScreen() {
    return ScreenHandlerState(screen: Screens.login);
  }

  ScreenHandlerState copyWith({Screens? screen}) {
    return ScreenHandlerState(screen: screen ?? this.screen);
  }

  @override
  String toString() {
    return '''ScreenHandlerState {
      screen: $screen,
    }''';
  }
}
