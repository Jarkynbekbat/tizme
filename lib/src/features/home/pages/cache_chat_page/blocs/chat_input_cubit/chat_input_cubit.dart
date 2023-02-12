import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studtime/src/features/home/pages/cache_chat_page/blocs/chat_content/chat_content_cubit.dart';
import 'package:studtime/src/features/home/pages/cache_chat_page/blocs/edit_message_cubit/edit_message_cubit.dart';

part 'chat_input_state.dart';
part 'chat_input_cubit.freezed.dart';

class ChatInputCubit extends Cubit<ChatInputState> {
  final ChatContentCubit _chatContentCubit;
  final EditMessageCubit _editMessageCubit;

  ChatInputCubit(
    this._chatContentCubit,
    this._editMessageCubit,
  ) : super(const ChatInputState.attachActions()) {
    textController.addListener(_onTextChanged);

    _chatContentSub = _chatContentCubit.stream.listen(_onChatContentChanged);
    _editMessageSub = _editMessageCubit.stream.listen(_onEditMessageChanged);
  }

  final textController = TextEditingController(text: '');
  final focusNode = FocusNode();

  late final StreamSubscription _chatContentSub;
  late final StreamSubscription _editMessageSub;

  @override
  Future<void> close() {
    textController.removeListener(_onTextChanged);
    textController.dispose();
    focusNode.dispose();

    _chatContentSub.cancel();
    _editMessageSub.cancel();
    return super.close();
  }

  void _onTextChanged() {
    final isTextEmpty = textController.text.isEmpty;
    final isEditing = _editMessageCubit.state.maybeMap(
      selected: (_) => true,
      orElse: () => false,
    );

    if (isTextEmpty && isEditing) {
      emit(const ChatInputState.sendDisabled());
      return;
    }

    if (isTextEmpty) {
      emit(const ChatInputState.attachActions());
      return;
    }

    emit(ChatInputState.send(textController.text));
  }

  void _onChatContentChanged(ChatContentState event) {
    event.map(
      error: (e) => emit(const ChatInputState.sendDisabled()),
      loading: (_) => emit(const ChatInputState.sendDisabled()),
      loaded: (loaded) {
        textController.clear();
        _editMessageCubit.unselect();
        _onTextChanged();
      },
    );
  }

  void _onEditMessageChanged(EditMessageState event) {
    event.map(
      notSelected: (_) {
        textController.clear();
        _onTextChanged();
      },
      selected: (selected) {
        textController.text = selected.textMessage.text;
        _onTextChanged();
      },
    );
  }
}
