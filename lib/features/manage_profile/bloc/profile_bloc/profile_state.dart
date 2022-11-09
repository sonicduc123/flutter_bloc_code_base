part of 'profile_bloc.dart';

class ProfileState {
  ProfileState({
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    this.isLoadData = true,
    this.isLoading = false,
  });
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  // TextEditingController birthdayController = TextEditingController();
  // UserModel? user;
  final bool isLoadData;
  final bool isLoading;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ProfileState copyWith({bool? isLoadData, bool? isLoading}) {
    return ProfileState(
      nameController: nameController,
      emailController: emailController,
      phoneController: phoneController,
      isLoadData: isLoadData ?? this.isLoadData,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
