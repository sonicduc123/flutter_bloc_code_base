import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/features.dart';
import '../../app.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    AppBloc appBloc = context.read<AppBloc>();
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        switch (state.status) {
          case AppStatus.unauthenticated:
            return const LoginPage();
          case AppStatus.loadData:
            return const WelcomePage();
          case AppStatus.authenticated:
            return Scaffold(
              body: state.currentPage,
              bottomNavigationBar: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Trang chủ',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Cài đặt',
                  ),
                ],
                onTap: (index) => appBloc.add(AppTabChanged(index: index)),
                currentIndex: state.index,
              ),
            );
        }
      },
    );
  }
}
