import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/profile/settings/bloc/settings_events.dart';
import 'package:ulearning/pages/profile/settings/bloc/settings_states.dart';

class SettingsBlocs extends Bloc<SettingsEvents, SettingState> {
  SettingsBlocs() : super(const SettingState()) {
    on<TriggerSettings>(_triggerSettings);
  }
  void _triggerSettings(SettingsEvents events, Emitter<SettingState> emit) {
    emit(const SettingState());
  }
}
