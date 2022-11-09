import 'package:flutter_bloc/flutter_bloc.dart';

part 'notify_event.dart';
part 'notify_state.dart';

class NotifyBloc extends Bloc<NotifyEvent, NotifyState> {
  NotifyBloc() : super(NotifyState()) {
    on<NotifyEvent>((event, emit) {
      
    });
  }
}
