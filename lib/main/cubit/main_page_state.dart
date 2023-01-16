// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'main_page_cubit.dart';

class MainPageState extends Equatable {
  const MainPageState({
    required this.notes,
    required this.isLoading,
  });

  factory MainPageState.initial() => const MainPageState(
        isLoading: false,
        notes: [],
      );

  final List<Note> notes;
  final bool isLoading;

  @override
  List<Object?> get props => [notes, isLoading];

  MainPageState copyWith({
    List<Note>? notes,
    bool? isLoading,
  }) {
    return MainPageState(
      notes: notes ?? this.notes,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
