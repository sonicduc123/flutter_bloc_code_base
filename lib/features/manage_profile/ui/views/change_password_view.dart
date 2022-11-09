import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../widgets/widgets.dart';
import '../../../features.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    ChangePasswordBloc changePasswordBloc = context.read<ChangePasswordBloc>();
    return ChildPage(
      title: 'Đổi mật khẩu',
      body: Form(
        key: changePasswordBloc.state.formKey,
        child: Column(
          children: [
            InputTextBox(
              label: 'Mật khẩu cũ',
              controller: changePasswordBloc.state.oldPasswordController,
              icon: Icons.lock,
              isPassword: true,
            ),
            const SizedBox(height: 20),
            InputTextBox(
              label: 'Mật khẩu mới',
              controller: changePasswordBloc.state.newPasswordController,
              icon: Icons.lock,
              isPassword: true,
            ),
            const SizedBox(height: 20),
            InputTextBox(
              label: 'Xác nhận mật khẩu',
              controller: changePasswordBloc.state.confirmPassword,
              icon: Icons.lock,
              isPassword: true,
            ),
            const SizedBox(height: 40),
            ExpandedButton(
              buttonName: 'Xác nhận',
              action: () {
                // controller.onConfirm();
              },
            ),
            const SizedBox(height: 20),
            context.watch<ChangePasswordBloc>().state.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
