import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:repository/repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(
    this._repository,
  ) : super(RegisterState.initial());

  final Repository _repository;

  Future<bool> register() async {
    try {
      emit(state.copyWith(isLoading: true));
      if (state.login == null || state.password == null) return false;
      await _repository.register(
        state.login!,
        state.password!,
        state.firstName!,
        state.password2!,
        state.lastName!,
      );
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

  void password2Changed(String password) {
    emit(state.copyWith(password2: password));
  }

  void firstNameChanged(String firstName) {
    emit(state.copyWith(firstName: firstName));
  }

  void lastNameChanged(String lastName) {
    emit(state.copyWith(lastName: lastName));
  }
}
