part of 'change_password_bloc.dart';

class ChangePasswordState {
  ChangePasswordState(
      {required this.oldPasswordController,
      required this.newPasswordController,
      required this.confirmPassword,
      this.isLoading = false});
  final TextEditingController oldPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController confirmPassword;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final bool isLoading;

  ChangePasswordState copyWith({bool? isLoading}) {
    return ChangePasswordState(
      oldPasswordController: oldPasswordController,
      newPasswordController: newPasswordController,
      confirmPassword: confirmPassword,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
