import 'package:bloc/bloc.dart';
import 'package:chat/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepository _authRepository;

  SignUpCubit(this._authRepository) : super(SignUpState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(
      email: value,
      status: SignUpStatus.initial,
    ));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(
      password: value,
      status: SignUpStatus.initial,
    ));
  }

  void confirmPasswordChanged(String value) {
    emit(state.copyWith(
      confirmPassword: value,
      status: SignUpStatus.initial,
    ));
  }

  Future<void> signUpWithCredentials() async {
    if (state.status == SignUpStatus.submitting) return;
    emit(state.copyWith(status: SignUpStatus.submitting));
    try {
      await _authRepository.signUp(
          email: state.email, password: state.password);
      emit(state.copyWith(status: SignUpStatus.success));
    } catch (_) {
      emit(state.copyWith(status: SignUpStatus.error));
    }
  }
}
