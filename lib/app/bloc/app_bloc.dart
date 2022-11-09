import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/features.dart';

part 'app_event.dart';
part 'app_state.dart';

enum AppBottomPage { home, setting }

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState(currentPage: HomePage())) {
    on<AppStarted>(onStarted);
    on<AppLoginSucceeded>(onLoginSucceeded);
    on<AppTabChanged>(onTabChanged);
    on<AppTabSwitched>(onTabSwitched);
    on<AppLogoutRequested>(onLogoutRequested);
  }

  List<Widget> listPage = [const HomePage(), const SettingPage()];

  onStarted(AppStarted event, Emitter<AppState> emit) async {
    // auto login
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(status: AppStatus.unauthenticated));
  }

  onLoginSucceeded(AppLoginSucceeded event, Emitter<AppState> emit) {
    emit(state.copyWith(status: AppStatus.authenticated));
  }

  onTabChanged(AppTabChanged event, Emitter<AppState> emit) {
    emit(
        state.copyWith(index: event.index, currentPage: listPage[event.index]));
  }

  onTabSwitched(AppTabSwitched event, Emitter<AppState> emit) {
    int index = 0;
    switch (event.bottomPage) {
      case AppBottomPage.home:
        index = 0;
        break;
      case AppBottomPage.setting:
        index = 1;
        break;
      default:
    }
    emit(state.copyWith(index: index, currentPage: listPage[index]));
  }

  onLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit) {
    emit(state.copyWith(status: AppStatus.unauthenticated));
  }
}
