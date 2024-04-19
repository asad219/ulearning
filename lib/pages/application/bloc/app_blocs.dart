import 'package:bloc/bloc.dart';

part 'app_events.dart';
part 'app_states.dart';

class AppBlocs extends Bloc<AppEvent, AppState> {
  AppBlocs() : super(const AppState());
}
