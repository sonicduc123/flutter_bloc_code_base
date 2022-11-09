import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc()
      : super(
          ChangePasswordState(
            oldPasswordController: TextEditingController(),
            newPasswordController: TextEditingController(),
            confirmPassword: TextEditingController(),
          ),
        ) {
    on<ChangePasswordEvent>((event, emit) {});
  }
}
