// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.login,
    this.password,
    required this.isLoading,
  });

  factory LoginState.initial() => const LoginState(
        isLoading: false,
      );

  final String? login;
  final String? password;
  final bool isLoading;

  @override
  List<Object?> get props => [login, password, isLoading];

  LoginState copyWith({
    String? login,
    String? password,
    bool? isLoading,
  }) {
    return LoginState(
      login: login ?? this.login,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
