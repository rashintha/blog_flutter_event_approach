import 'package:equatable/equatable.dart';

abstract class ScreenHandlerEvent extends Equatable {
  const ScreenHandlerEvent([List props = const []]);
}

class ShowLoginScreen extends ScreenHandlerEvent {
  const ShowLoginScreen();

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  String toString() => 'Show Login Screen';
}

class ShowHomeScreen extends ScreenHandlerEvent {
  const ShowHomeScreen();

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  String toString() => 'Show Login Screen';
}
