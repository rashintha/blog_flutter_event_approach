import 'package:flutter_event_approach/utils/barrell.dart';

class AuthState {
  final UserStatus status;

  AuthState({required this.status});

  factory AuthState.loadDefault() {
    return AuthState(status: UserStatus.loggedOut);
  }

  AuthState copyWith({UserStatus? status}) {
    return AuthState(status: status ?? this.status);
  }

  @override
  String toString() {
    return '''AuthState {
      status: $status
    }''';
  }
}
