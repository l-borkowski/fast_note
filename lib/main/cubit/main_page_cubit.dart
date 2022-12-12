import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:repository/repository.dart';

part 'main_page_state.dart';

class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit(
    this._repository,
  ) : super(MainPageState.initial());

  final Repository _repository;

  Future<void> init() async {
    emit(state.copyWith(isLoading: true));
    final notes = await _repository.getNotes(3);
    await Future<void>.delayed(const Duration(seconds: 3));
    log('xd');

    emit(
      state.copyWith(
        notes: notes,
        isLoading: false,
      ),
    );
  }
}
