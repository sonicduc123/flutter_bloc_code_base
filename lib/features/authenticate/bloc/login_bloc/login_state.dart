part of 'login_bloc.dart';

class LoginState {
  LoginState(
      {required this.emailController,
      required this.passwordController,
      this.isRememberPassword = true,
      this.isLoading = false,
      this.isSuccess = false,
      this.error = ''});
  TextEditingController emailController;
  TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final bool isRememberPassword;
  final bool isLoading;
  final bool isSuccess;
  final String error;

  LoginState copyWith(
      {bool? isRememberPassword,
      bool? isLoading,
      bool? isSuccess,
      String? error}) {
    log(emailController.text);
    return LoginState(
      emailController: emailController,
      passwordController: passwordController,
      isRememberPassword: isRememberPassword ?? this.isRememberPassword,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error ?? this.error,
    );
  }
}
