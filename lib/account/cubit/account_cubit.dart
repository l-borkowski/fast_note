import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:repository/repository.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit(
    this._repository,
  ) : super(AccountState.initial());

  final Repository _repository;

  void init() {
    getAccountDetails();
  }

  Future<void> getAccountDetails() async {
    try {
      emit(state.copyWith(isLoading: true));

      final user = await _repository.getUser();

      emit(state.copyWith(
        user: user,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  // ignore: avoid_setters_without_getters
  set loggedIn(bool value) => emit(state.copyWith(isLoggedIn: value));
}
