import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_event_approach/blocs/screen/barrell.dart';
import 'package:flutter_event_approach/utils/barrell.dart';

class ScreenHandlerBloc extends Bloc<ScreenHandlerEvent, ScreenHandlerState> {
  ScreenHandlerBloc() : super(ScreenHandlerState.loginScreen()) {
    on<ShowLoginScreen>(
        (event, emit) async => {emit(state.copyWith(screen: Screens.login))});
    on<ShowHomeScreen>(
        (event, emit) async => {emit(state.copyWith(screen: Screens.home))});
  }
}
