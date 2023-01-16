import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:repository/repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this._repository,
  ) : super(LoginState.initial());

  final Repository _repository;

  Future<bool> login() async {
    try {
      emit(state.copyWith(isLoading: true));
      if (state.login == null || state.password == null) return false;
      await _repository.login(state.login!, state.password!);

      emit(state.copyWith(isLoading: false));
      return true;
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      return false;
    }
  }

  void emailChanged(String email) {
    emit(state.copyWith(login: email));
  }

  void passwordChanged(String password) {
    emit(state.copyWith(password: password));
  }
}
