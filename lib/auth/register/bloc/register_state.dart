part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object?> get props => [];
}

// initial
class RegisterInitial extends RegisterState {}

// loading
class RegisterLoading extends RegisterState {}

// success
class RegisterSuccess extends RegisterState {
  // object
  final RegisterResponse registerResponse;
  // put required constructor
  RegisterSuccess(this.registerResponse);
  // override
  @override
  List<Object?> get props => [registerResponse];
}

// failure
class RegisterFailure extends RegisterState {
  final dynamic message;
  RegisterFailure(this.message);
  //
  @override
  List<Object?> get props => [message];
}
