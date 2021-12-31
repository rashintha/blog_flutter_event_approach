import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_event_approach/blocs/barrell.dart';
import 'package:flutter_event_approach/utils/barrell.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.screenHandlerBloc}) : super(AuthState.loadDefault()) {
    on<Login>((event, emit) async =>
        {emit(await _mapLoginToState(event.username, event.password))});
  }

  final ScreenHandlerBloc screenHandlerBloc;

  Future<AuthState> _mapLoginToState(String username, String password) async {
    if (username == 'admin' && password == '123') {
      screenHandlerBloc.add(const ShowHomeScreen());
      return state.copyWith(status: UserStatus.loggedIn);
    }

    return state.copyWith(status: UserStatus.invalidUser);
  }
}
