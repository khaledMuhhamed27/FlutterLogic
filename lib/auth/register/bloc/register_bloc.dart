import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_logic/auth/register/model/register_model.dart';
import 'package:flutter_logic/auth/register/repository/register_repo.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  // object from repository
  final RegisterRepo registerRepo;
  RegisterBloc({required this.registerRepo}) : super(RegisterInitial()) {
    on<RegisterUserEvent>(_onRegister);
  }
  // create function for register
  Future<void> _onRegister(
      RegisterUserEvent event, Emitter<RegisterState> emit) async {
    // loading
    emit(RegisterLoading());
    // try & catch
    try {
      final respose = await registerRepo.register(
          name: event.name,
          email: event.email,
          password: event.password,
          confirmPassword: event.confirmPassword,
          phone: event.phone);
      emit(RegisterSuccess(respose));
    } catch (error) {
      emit(RegisterFailure(error));
    }
  }
}
