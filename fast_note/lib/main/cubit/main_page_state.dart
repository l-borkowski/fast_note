// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'main_page_cubit.dart';

class MainPageState extends Equatable {
  const MainPageState({
    this.notes,
    required this.isLoading,
  });

  factory MainPageState.initial() => const MainPageState(
        isLoading: false,
      );

  final List<Note>? notes;
  final bool isLoading;

  @override
  List<Object?> get props => [notes];

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
