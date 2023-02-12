part of 'edit_message_cubit.dart';

@freezed
class EditMessageState with _$EditMessageState {
  const factory EditMessageState.notSelected() = _NotSelected;
  const factory EditMessageState.selected(ChatText textMessage) = _Selected;
}
