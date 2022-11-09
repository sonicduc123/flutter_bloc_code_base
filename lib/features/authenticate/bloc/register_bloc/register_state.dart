part of 'register_bloc.dart';

class RegisterState {
  RegisterState({this.isLoadData = false, this.isLoading = false});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // TextEditingController birthdayController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final bool isLoading;
  final bool isLoadData;

  RegisterState copyWith({bool? isLoadData, bool? isLoading}) {
    return RegisterState(
      isLoadData: isLoadData ?? this.isLoadData,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
