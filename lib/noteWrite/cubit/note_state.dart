// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'note_cubit.dart';

class NoteState extends Equatable {
  const NoteState({
    required this.note,
    required this.isLoading,
    this.id,
  });

  factory NoteState.initial() => NoteState(
        isLoading: false,
        note: Note.empty(),
      );

  final Note note;
  final bool isLoading;
  final int? id;

  @override
  List<Object?> get props => [note, isLoading, id];

  NoteState copyWith({
    Note? note,
    bool? isLoading,
    int? id,
  }) {
    return NoteState(
      note: note ?? this.note,
      isLoading: isLoading ?? this.isLoading,
      id: id ?? this.id,
    );
  }
}
