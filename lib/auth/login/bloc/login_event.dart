part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginUserEvent extends LoginEvent {
  final String email;
  final String password;
  LoginUserEvent({
    required this.email,
    required this.password,
  });
  @override
  List<Object?> get props => [email, password];
}
