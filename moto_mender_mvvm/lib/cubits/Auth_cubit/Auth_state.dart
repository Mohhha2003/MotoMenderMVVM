part of 'Auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginFailed extends AuthState {
  final String message;

  LoginFailed({required this.message});
}

//     SIGN UP STATES

final class SignUpLoading extends AuthState {}

final class SignUpSucces extends AuthState {}

final class SignUpFailed extends AuthState {
  final String message;

  SignUpFailed({required this.message});
}

final class SingUpOTPMatch extends AuthState {
  final String message;

  SingUpOTPMatch({required this.message});
}

//    RESITING PASSWORD

final class ForgetPasswordFailed extends AuthState {
  final String message;

  ForgetPasswordFailed({required this.message});
}

final class ForgetPasswordLoading extends AuthState {}

final class ForgetPasswordSuccess extends AuthState {}

final class FortgetPassowrdOTPMatch extends AuthState {}

final class ResetPasswordFailed extends AuthState {
  final String message;

  ResetPasswordFailed({required this.message});
}

final class ResetPasswordSuccess extends AuthState {
  final String message;

  ResetPasswordSuccess({required this.message});
}

final class ResetPasswordLoading extends AuthState {}

final class OTPWrong extends AuthState {
  final String message;

  OTPWrong({required this.message});

}
