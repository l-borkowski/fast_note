// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'account_cubit.dart';

class AccountState extends Equatable {
  const AccountState({
    this.user,
    required this.isLoading,
    required this.isLoggedIn,
  });

  factory AccountState.initial() => const AccountState(
        isLoading: false,
        isLoggedIn: false,
      );

  final User? user;
  final bool isLoading;
  final bool isLoggedIn;

  @override
  List<Object?> get props => [user];

  AccountState copyWith({
    User? user,
    bool? isLoading,
    bool? isLoggedIn,
  }) {
    return AccountState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }
}
