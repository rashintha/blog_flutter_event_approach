import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent([List props = const []]);
}

class Login extends AuthEvent {
  const Login({required this.username, required this.password});

  final String username;
  final String password;

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  String toString() => 'Login';
}
