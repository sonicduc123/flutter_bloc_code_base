import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/widgets.dart';
import '../../../features.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterBloc registerBloc = context.read<RegisterBloc>();
    return ChildPage(
      title: 'Đăng ký',
      body: context.watch<RegisterBloc>().state.isLoadData
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: registerBloc.state.formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      InputTextBox(
                        label: 'Họ và tên',
                        controller: registerBloc.state.nameController,
                        icon: Icons.person,
                      ),
                      // const SizedBox(height: 20),
                      // Dropdown(
                      //   hint: 'Phòng ban',
                      //   listItem: controller.listDepartment,
                      //   callback: (value) {
                      //     controller.currentDepartment = value;
                      //     log(controller.currentDepartment!.name!);
                      //   },
                      //   icon: Icons.business_center,
                      // ),
                      // const SizedBox(height: 20),
                      // DatePicker(
                      //   initDate: controller.birthdayController.text,
                      //   pickDate: (value) {
                      //     log(value);
                      //     controller.birthdayController.text = value;
                      //   },
                      //   label: 'Ngày sinh',
                      // ),
                      const SizedBox(height: 20),
                      InputTextBox(
                        label: 'Email',
                        controller: registerBloc.state.emailController,
                        icon: Icons.email,
                      ),
                      const SizedBox(height: 20),
                      InputTextBox(
                        label: 'Số điện thoại',
                        controller: registerBloc.state.phoneController,
                        icon: Icons.phone,
                        isNumber: true,
                      ),
                      const SizedBox(height: 20),
                      InputTextBox(
                        label: 'Mật khẩu',
                        controller: registerBloc.state.passwordController,
                        icon: Icons.lock,
                        isPassword: true,
                      ),
                      const SizedBox(height: 20),
                      InputTextBox(
                        label: 'Xác nhận mật khẩu',
                        controller:
                            registerBloc.state.confirmPasswordController,
                        icon: Icons.lock,
                        isPassword: true,
                      ),
                      const SizedBox(height: 40),
                      ExpandedButton(
                        buttonName: 'Đăng ký',
                        action: () {
                          registerBloc.add(RegisterButtonPressed());
                        },
                      ),
                      const SizedBox(height: 20),
                      context.watch<RegisterBloc>().state.isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : const SizedBox(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Đã có tài khoản?'),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Đăng nhập'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
