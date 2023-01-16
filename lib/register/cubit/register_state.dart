part of 'register_cubit.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.login,
    this.password,
    this.password2,
    this.firstName,
    this.lastName,
    required this.isLoading,
  });

  factory RegisterState.initial() => const RegisterState(
        isLoading: false,
      );

  final String? login;
  final String? password;
  final String? password2;
  final String? firstName;
  final String? lastName;
  final bool isLoading;

  @override
  List<Object?> get props {
    return [login, password, password2, firstName, lastName];
  }

  RegisterState copyWith({
    String? login,
    String? password,
    String? password2,
    String? firstName,
    String? lastName,
    bool? isLoading,
  }) {
    return RegisterState(
      login: login ?? this.login,
      password: password ?? this.password,
      password2: password2 ?? this.password2,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
