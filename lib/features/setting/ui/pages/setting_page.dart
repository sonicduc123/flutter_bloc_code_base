import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/app.dart';
import '../../../../routes/routes_name.dart';
import '../../../../widgets/widgets.dart';
import '../../../features.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicPage(
      title: 'Cài đặt',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: const [
              SettingsItem(
                icon: Icons.person,
                title: 'Quản lý tài khoản',
                routeName: RoutesName.profile,
              ),
              SettingsItem(
                icon: Icons.lock,
                title: 'Đổi mật khẩu',
                routeName: RoutesName.changePassword,
              )
            ],
          ),
          ExpandedButton(
            buttonName: 'Đăng xuất',
            action: () {
              context.read<AppBloc>().add(AppLogoutRequested());
            },
          )
        ],
      ),
    );
  }
}
