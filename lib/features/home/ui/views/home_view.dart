import 'package:flutter/material.dart';

import '../../../../routes/routes_name.dart';
import '../../../../widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicPage(
      title: 'Trang chủ',
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.notify);
          },
          icon: const Icon(
            Icons.notifications,
            size: 30,
          ),
        )
      ],
      body: Container(),
    );
  }
}
