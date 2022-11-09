import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc() : super(ForgetPasswordState()) {
    on<ForgetPasswordConfirmButtonPressed>(onConfirmButtonPressed);
  }

  onConfirmButtonPressed(ForgetPasswordConfirmButtonPressed event,
      Emitter<ForgetPasswordState> emit) {
    if (state.formKey.currentState!.validate()) {}
  }
}
