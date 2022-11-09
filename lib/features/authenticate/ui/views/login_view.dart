import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/app.dart';
import '../../../../constants/app_images.dart';
import '../../../../routes/routes_name.dart';
import '../../../../widgets/toast/show_toast.dart';
import '../../../../widgets/widgets.dart';
import '../../../features.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    LoginBloc loginBloc = context.read<LoginBloc>();

    return ChildPage(
      title: 'Đăng nhập',
      body: Form(
        key: loginBloc.state.formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  AppImages.logo,
                  height: 150,
                  width: 150,
                ),
              ),
              const SizedBox(height: 20),
              InputTextBox(
                label: 'Email',
                controller: loginBloc.state.emailController,
                icon: Icons.email,
              ),
              const SizedBox(height: 20),
              InputTextBox(
                label: 'Mật khẩu',
                controller: loginBloc.state.passwordController,
                isPassword: true,
                icon: Icons.lock,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      value:
                          context.watch<LoginBloc>().state.isRememberPassword,
                      onChanged: (isCheck) {
                        loginBloc.add(LoginRememberPasswordChecked());
                      },
                      title: const Text(
                        'Lưu mật khẩu',
                        style: TextStyle(fontSize: 14),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesName.forgetPassword);
                      },
                      child: const Text('Quên mật khẩu?'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state.isSuccess) {
                    context.read<AppBloc>().add(AppLoginSucceeded());
                  }
                  if (state.error != '') {
                    showToast(
                      context: context,
                      message: state.error,
                      type: ToastType.fail,
                    );
                  }
                },
                child: ExpandedButton(
                  buttonName: 'Đăng nhập',
                  action: () {
                    loginBloc.add(LoginButtonPressed());
                  },
                ),
              ),
              const SizedBox(height: 20),
              context.watch<LoginBloc>().state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : const SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Chưa có tài khoản?'),
                  TextButton(
                    onPressed: () async {
                      Navigator.pushNamed(context, RoutesName.register);
                    },
                    child: const Text('Đăng ký'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
