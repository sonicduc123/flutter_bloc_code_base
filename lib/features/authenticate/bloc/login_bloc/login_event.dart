part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {}

class LoginRememberPasswordChecked extends LoginEvent {}