import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/widgets.dart';
import '../../../features.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordBloc forgetPasswordBloc = context.read<ForgetPasswordBloc>();
    return ChildPage(
      title: 'Quên mật khẩu',
      body: Form(
        key: forgetPasswordBloc.state.formKey,
        child: Column(
          children: [
            const Text('Nhập email của bạn để khôi phục mật khẩu: '),
            const SizedBox(height: 20),
            InputTextBox(
              label: 'Email',
              controller: forgetPasswordBloc.state.emailController,
              icon: Icons.email,
            ),
            const SizedBox(height: 20),
            ExpandedButton(
              buttonName: 'Xác nhận',
              action: () {
                forgetPasswordBloc.add(ForgetPasswordConfirmButtonPressed());
              },
            ),
          ],
        ),
      ),
    );
  }
}
