import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:repository/repository.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit(
    this._repository,
  ) : super(NoteState.initial());

  final Repository _repository;

  void clearNote(int? id) {
    emit(state.copyWith(
      note: Note.empty(),
      id: id,
    ));
  }

  Future<Note> init(int? id) async {
    if (id == null) return Note.empty();

    emit(state.copyWith(isLoading: true));

    final note = await _repository.getNote(id);

    emit(
      state.copyWith(
        note: note,
        isLoading: false,
      ),
    );

    return note;
  }

  Future<void> saveNote() async {
    try {
      emit(state.copyWith(isLoading: true));
      if (state.id != null) {
        await _repository.editNote(state.note, state.id!);
      } else {
        await _repository.saveNote(state.note);
      }

      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  void titleChanged(String title) {
    emit(state.copyWith(note: state.note.copyWith(title: title)));
  }

  void bodyChanged(String body) {
    emit(state.copyWith(note: state.note.copyWith(body: body)));
  }
}
