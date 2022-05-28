part of 'signup_cubit.dart';

enum SignUpStatus { initial, submitting, success, error }

class SignUpState extends Equatable {
  final String email;
  final String password;
  final String confirmPassword;
  final SignUpStatus status;

  const SignUpState(
      {required this.email,
      required this.password,
      required this.confirmPassword,
      required this.status});

  factory SignUpState.initial() {
    return const SignUpState(
      email: '',
      password: '',
      confirmPassword: '',
      status: SignUpStatus.initial,
    );
  }

  @override
  List<Object> get props => [email, password, status];

  SignUpState copyWith({
    String? email,
    String? password,
    String? confirmPassword,
    SignUpStatus? status,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
    );
  }
}
