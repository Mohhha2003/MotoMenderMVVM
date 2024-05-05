import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:moto_mender_mvvm/cache/cache_helper.dart';
import 'package:moto_mender_mvvm/models/auth_model/auth_model.dart';
import 'package:moto_mender_mvvm/repos/auth_repo.dart';

part 'Auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  final AuthRepo authRepo;

  // LOGIN CONTORLLERS

  bool rememberMe = false;
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();

  //   SIGNUP CONTROLLERS

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController reTypePassword = TextEditingController();

  //  RESITING PASSWORD
  TextEditingController resetPasswordEmail = TextEditingController();
  TextEditingController newPassword = TextEditingController();

  late String otp;

  AuthModel? loginModel;

  Future<void> login() async {
    emit(LoginLoading());
    final respone = await authRepo.login(
        email: loginEmail.text, password: loginPassword.text);

    respone.fold((errorMessage) => emit(LoginFailed(message: errorMessage)),
        (success) {
      CacheHelper.currentUser = success.user!;
      if (rememberMe) {
        CacheHelper().saveData(key: 'email', value: loginEmail.text);
        CacheHelper().saveData(key: 'password', value: loginPassword.text);
      }
      loginEmail.clear();
      loginPassword.clear();
      emit(LoginSuccess());
    });
  }

  Future<void> signUp() async {
    final response = await authRepo.signUp(
        email: email.text,
        name: name.text,
        password: password.text,
        phone: phone.text,
        address: address.text);
    response.fold(
      (errorMessage) => emit(SignUpFailed(message: errorMessage)),
      (success) {
        otp = success.user!.emailVerify!;
        CacheHelper.currentUser = success.user!;

        name.clear();
        password.clear();
        reTypePassword.clear();
        phone.clear();
        address.clear();
        emit(SignUpSucces());
      },
    );
  }

  Future<void> forgetPassword() async {
    emit(ForgetPasswordLoading());
    final response =
        await authRepo.forgetPassword(email: resetPasswordEmail.text);

    response.fold(
        (errorMessage) => emit(ForgetPasswordFailed(message: errorMessage)),
        (verficationOTP) {
      otp = verficationOTP;
      emit(ForgetPasswordSuccess());
    });
  }

  void checkOTP({required String userOTP, required isNewUser}) {
    if (isNewUser && userOTP == otp) {
      verfiyEmail();
    } else if (isNewUser == false && userOTP == otp) {
      emit(FortgetPassowrdOTPMatch());
    } else {
      emit(OTPWrong(message: 'Wrong OTP'));
    }
  }

  Future<void> resetPassword() async {
    final response = await authRepo.resetPassword(
        newPassword: newPassword.text,
        otp: otp,
        email: resetPasswordEmail.text);

    response.fold(
      (errorMessage) => emit(ResetPasswordFailed(message: errorMessage)),
      (success) => emit(ResetPasswordSuccess(message: success)),
    );
  }

  Future<void> verfiyEmail() async {
    final response = await authRepo.verfiyEmail(email: email.text);
    response.fold(
      (errorMessage) => emit(OTPWrong(message: errorMessage)),
      (success) => emit(SingUpOTPMatch(message: success)),
    );
  }
}
