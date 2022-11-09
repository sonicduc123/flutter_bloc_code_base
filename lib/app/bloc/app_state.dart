part of 'app_bloc.dart';

enum AppStatus { authenticated, unauthenticated, loadData }

class AppState {
  const AppState({this.status = AppStatus.loadData, this.index = 0, required this.currentPage});

  final AppStatus status;
  final int index;
  final Widget currentPage;

  AppState copyWith({AppStatus? status, int? index, Widget? currentPage}) {
    return AppState(
      currentPage: currentPage ?? this.currentPage,
      status: status ?? this.status,
      index: index ?? this.index,
    );
  }
}
