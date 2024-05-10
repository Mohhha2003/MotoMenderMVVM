import 'package:moto_mender_mvvm/models/chat_models/message_model.dart';

class ChatRoomMessagesModel {
  String? chatRoomId;
  List<MessageModel>? messages;

  ChatRoomMessagesModel({this.chatRoomId, this.messages});

  factory ChatRoomMessagesModel.fromJson(Map<String, dynamic> json) {
    try {
      return ChatRoomMessagesModel(
        chatRoomId: json['chatRoomId'] as String?,
        messages: (json['messages'] as List<dynamic>?)
            ?.map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      print('Error parsing ChatRoomMessagesModel: $e');
      return ChatRoomMessagesModel(); // Return an empty model or handle the error as needed
    }
  }

  Map<String, dynamic> toJson() => {
        'chatRoomId': chatRoomId,
        'messages': messages?.map((e) => e.toJson()).toList(),
      };
}
