import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part './register_event.dart';
part './register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    on<RegisterButtonPressed>(onRegisterButtonPressed);
  }

  onRegisterButtonPressed(RegisterButtonPressed event, Emitter<RegisterState> emit) {
    if (state.formKey.currentState!.validate()) {
      
    }
  }
}
