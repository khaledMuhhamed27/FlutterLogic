part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterUserEvent extends RegisterEvent {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String phone;

  RegisterUserEvent(
      {required this.name,
      required this.email,
      required this.password,
      required this.confirmPassword,
      required this.phone});
  //
  @override
  List<Object?> get props => [
        name,
        email,
        password,
        confirmPassword,
        phone,
      ];
}
