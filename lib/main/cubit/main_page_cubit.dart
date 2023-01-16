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

  Future<void> getNotes() async {
    try {
      emit(state.copyWith(isLoading: true));
      final notes = await _repository.getNotes();

      emit(
        state.copyWith(
          notes: notes.reversed.toList(),
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          notes: [],
          isLoading: false,
        ),
      );
    }
  }
}
