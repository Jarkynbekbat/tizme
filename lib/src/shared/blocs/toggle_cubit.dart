import 'package:flutter_bloc/flutter_bloc.dart';

class ToggleCubit extends Cubit<bool> {
  ToggleCubit(bool initialValue) : super(initialValue);

  void toggle() {
    emit(!state);
  }

  void set(bool value) {
    emit(value);
  }
}
