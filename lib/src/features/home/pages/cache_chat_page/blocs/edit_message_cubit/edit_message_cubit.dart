import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studtime/src/shared/data/models/chat/chat_text.dart';

part 'edit_message_state.dart';
part 'edit_message_cubit.freezed.dart';

class EditMessageCubit extends Cubit<EditMessageState> {
  EditMessageCubit() : super(const EditMessageState.notSelected());

  void select(ChatText textMessage) {
    emit(EditMessageState.selected(textMessage));
  }

  void unselect() {
    emit(const EditMessageState.notSelected());
  }
}
