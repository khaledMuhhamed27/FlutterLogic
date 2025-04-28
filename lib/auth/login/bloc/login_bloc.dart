import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_logic/auth/login/model/login_model.dart';
import 'package:flutter_logic/auth/login/repository/login_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  //1 call repo
  final LoginRepo loginRepo;
  LoginBloc({required this.loginRepo}) : super(LoginInitial()) {
    on<LoginUserEvent>(_onLogin);
  }
  Future<void> _onLogin(LoginUserEvent event, Emitter<LoginState> emit) async {
    // 1 login loading
    emit(LoginLoading());
    // 2 try & catch
    try {
      final response = await loginRepo.login(
        email: event.email,
        password: event.password,
      );
      // 3 emit success
      emit(LoginSuccess(response));
    } catch (error) {
      // 4 emit failure
      emit(LoginFailure(error));
    }
  }
}
