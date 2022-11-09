part of 'app_bloc.dart';

@immutable
abstract class AppEvent {}

class AppStarted extends AppEvent {}

class AppLoginSucceeded extends AppEvent {}

class AppTabChanged extends AppEvent {
  AppTabChanged({required this.index});
  final int index;
}

class AppTabSwitched extends AppEvent {
  AppTabSwitched({required this.bottomPage});
  final AppBottomPage bottomPage;
}

class AppLogoutRequested extends AppEvent {}
