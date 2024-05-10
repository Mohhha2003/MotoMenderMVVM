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

  ChatState({
    this.messages,
    this.chatRoomId,
    this.receivedMessage,
    this.errorMessage,
    required this.status,
  });

  factory ChatState.initial() {
    return ChatState(status: ChatStatus.initial);
  }

  ChatState copyWith(
      {MessageModel? receivedMessage,
      List<MessageModel>? messages,
      String? errorMessage,
      ChatStatus? status,
      String? chatRoomId}) {
    return ChatState(
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
    print('The lenght is ${updatedMessages.length}');
    return copyWith(messages: updatedMessages);
  }
}
