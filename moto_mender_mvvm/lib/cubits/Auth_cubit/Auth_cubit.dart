import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:moto_mender_mvvm/cache/cache_helper.dart';
import 'package:moto_mender_mvvm/models/auth_model/auth_model.dart';
import 'package:moto_mender_mvvm/repos/auth_repo.dart';

part 'Auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  final AuthRepo authRepo;

  GlobalKey<FormState> loginState = GlobalKey();
  GlobalKey<FormState> signUpState = GlobalKey();
  bool rememberMe = false;

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
    final respone =
        await authRepo.login(email: email.text, password: password.text);

    respone.fold((errorMessage) => emit(LoginFailed(message: errorMessage)),
        (success) {
      CacheHelper.currentUser = success.user!;
      if (rememberMe) {
        CacheHelper().saveData(key: 'email', value: email.text);
        CacheHelper().saveData(key: 'password', value: password.text);
      }
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
      (errorMessage) => SignUpFailed(message: errorMessage),
      (success) => emit(SignUpSucces()),
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

  bool checkOTP({required String userOTP}) {
    if (userOTP == otp) {
      emit(OTPMatch());
      return true;
    }
    emit(OTPWrong());
    return false;
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
}
