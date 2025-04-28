part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final LoginResponse loginResponse;
  LoginSuccess(this.loginResponse);
  @override
  List<Object?> get props => [loginResponse];
}

final class LoginFailure extends LoginState {
  final dynamic message;
  LoginFailure(this.message);
  @override
  List<Object?> get props => [message];
}
