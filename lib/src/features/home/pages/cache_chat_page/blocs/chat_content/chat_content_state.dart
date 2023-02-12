part of 'chat_content_cubit.dart';

@freezed
class ChatContentState with _$ChatContentState {
  const factory ChatContentState.loading() = _Loading;
  const factory ChatContentState.loaded(List<ChatMessage> messages) = _Loaded;
  const factory ChatContentState.error(String message) = _Error;
}
