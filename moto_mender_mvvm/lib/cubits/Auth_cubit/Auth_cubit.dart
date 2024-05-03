import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:moto_mender_mvvm/core/api/api_consumer.dart';
import 'package:moto_mender_mvvm/core/api/endpoints.dart';
import 'package:moto_mender_mvvm/core/errors/exceptions.dart';
import 'package:moto_mender_mvvm/models/auth_model/auth_model.dart';
import 'package:moto_mender_mvvm/repos/auth_repo.dart';

part 'Auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  final AuthRepo authRepo;

  GlobalKey<FormState> loginState = GlobalKey();
  GlobalKey<FormState> signUpState = GlobalKey();

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController reTypePassword = TextEditingController();

  //  RESITING PASSWORD
  TextEditingController resetPasswordEmail = TextEditingController();

  AuthModel? loginModel;

  Future<void> login() async {
    final respone =
        await authRepo.login(email: email.text, password: password.text);

    respone.fold(
      (errorMessage) => emit(LoginFailed(message: errorMessage)),
      (success) => emit(LoginSuccess()),
    );
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
    emit(ResetPasswordLoading());
    final response =
        await authRepo.forgetPassword(email: resetPasswordEmail.text);  

    response.fold(
      (errorMessage) => emit(ResetPasswordFailed(message: errorMessage)),
      (success) => emit(ResetPasswordSuccess()),
    );
  }
}
