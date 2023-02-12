part of 'chat_input_cubit.dart';

@freezed
class ChatInputState with _$ChatInputState {
  const factory ChatInputState.send(String text) = _Send;
  const factory ChatInputState.sendDisabled() = _SendDisabled;
  const factory ChatInputState.attachActions() = _AttachActions;
}
