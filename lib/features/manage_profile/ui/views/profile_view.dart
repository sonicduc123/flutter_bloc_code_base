import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/widgets.dart';
import '../../../features.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileBloc profileBloc = context.read<ProfileBloc>();
    return ChildPage(
      title: 'Quản lý tài khoản',
      body:
          // context.watch<ProfileBloc>().state.isLoadData
          //     ? const Center(
          //         child: CircularProgressIndicator(),
          //       )
          //     :
          SingleChildScrollView(
        child: Form(
          key: profileBloc.state.formKey,
          child: Column(
            children: [
              InputTextBox(
                label: 'Họ và tên',
                controller: profileBloc.state.nameController,
                icon: Icons.person,
              ),
              // const SizedBox(height: 20),
              // InputTextBox(
              //   label: 'Phòng ban',
              //   controller: TextEditingController(
              //       text: controller.user!.departmentName),
              //   icon: Icons.business_center,
              //   isReadOnly: true,
              // ),
              // const SizedBox(height: 20),
              // InputTextBox(
              //   label: 'Chức vụ',
              //   controller: TextEditingController(
              //       text: controller.user!.roleName),
              //   icon: Icons.settings_accessibility,
              //   isReadOnly: true,
              // ),
              // const SizedBox(height: 20),
              // DatePicker(
              //   initDate: controller.birthdayController.text,
              //   pickDate: (value) {
              //     controller.birthdayController.text = value;
              //   },
              //   label: 'Ngày sinh',
              // ),
              const SizedBox(height: 20),
              InputTextBox(
                label: 'Email',
                controller: profileBloc.state.emailController,
                icon: Icons.email,
                isReadOnly: true,
              ),
              const SizedBox(height: 20),
              InputTextBox(
                label: 'Số điện thoại',
                controller: profileBloc.state.phoneController,
                icon: Icons.phone,
                isNumber: true,
                isReadOnly: true,
              ),
              const SizedBox(height: 40),
              ExpandedButton(
                buttonName: 'Lưu',
                action: () {
                  // controller.onSave();
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        showDialogBox(
                          context: context,
                          title: 'Bạn có chắc sẽ xoá tài khoản không?',
                          content:
                              'Tài khoản của bạn sẽ bị xoá, vui lòng liên hệ phòng IT để cấp lại tài khoản.',
                          type: DialogType.delete,
                          confirmAction: () {
                            // controller.onDeleteAccount();
                          },
                        );
                      },
                      style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          side: const BorderSide(color: Colors.red)),
                      child: const Text(
                        'Xoá tài khoản',
                        style: TextStyle(fontSize: 18, color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              context.watch<ProfileBloc>().state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
