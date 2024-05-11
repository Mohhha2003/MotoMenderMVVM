import 'package:moto_mender_mvvm/models/chat_models/message_model.dart';

enum ChatStatus {
  initial,
  messageSentSuccess,
  messageReceived,
  failed,
  chatRoomSuccess
}

class ChatState {
  final MessageModel? receivedMessage;
  final List<MessageModel>? messages;
  final String? errorMessage;
  final ChatStatus status;
  final String? chatRoomId;
  final bool? isUserTyping;

  ChatState({
    this.isUserTyping,
    this.messages,
    this.chatRoomId,
    this.receivedMessage,
    this.errorMessage,
    required this.status,
  });

  factory ChatState.initial() {
    return ChatState(
        status: ChatStatus.initial, messages: [], isUserTyping: false);
  }

  ChatState copyWith(
      {MessageModel? receivedMessage,
      bool? isUserTyping,
      List<MessageModel>? messages,
      String? errorMessage,
      ChatStatus? status,
      String? chatRoomId}) {
    return ChatState(
      isUserTyping: isUserTyping ?? this.isUserTyping,
      messages: messages ?? this.messages,
      chatRoomId: chatRoomId ?? this.chatRoomId,
      receivedMessage: receivedMessage ?? this.receivedMessage,
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
    );
  }

  ChatState addMessage(MessageModel message) {
    List<MessageModel> updatedMessages = List.from(messages ?? [])
      ..add(message);
    return copyWith(messages: updatedMessages);
  }
}
