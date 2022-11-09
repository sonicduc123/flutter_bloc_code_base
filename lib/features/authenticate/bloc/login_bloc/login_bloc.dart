import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc()
      : super(LoginState(
          emailController: TextEditingController(),
          passwordController: TextEditingController(),
        )) {
    on<LoginButtonPressed>(onLoginButtonPressed);
    on<LoginRememberPasswordChecked>(onRememberPasswordChecked);
  }

  onLoginButtonPressed(LoginButtonPressed event, Emitter<LoginState> emit) {
    if (state.formKey.currentState!.validate()) {
      emit(state.copyWith(isSuccess: true));
    }
  }

  onRememberPasswordChecked(
      LoginRememberPasswordChecked event, Emitter<LoginState> emit) {
    emit(state.copyWith(isRememberPassword: !state.isRememberPassword));
  }
}
