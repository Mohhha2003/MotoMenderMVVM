import 'package:flutter/material.dart';
import 'package:moto_mender_mvvm/cache/cache_helper.dart';
import 'package:moto_mender_mvvm/core/api/endpoints.dart';
import 'package:moto_mender_mvvm/models/chat_models/message_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketIo {
  // final List EVENTS = []
  final IO.Socket socket = IO.io(EndPoint.baseUrl, <String, dynamic>{
    "transports": ["websocket"],
    "autoConnect": false
  });

  void listenToMessages(Function(String)? onMessageReceived) {
    socket.on(
        ApiKey.message,
        (message) => {
              onMessageReceived!(message),
            });
  }

//   SOCKET EMIITERS

  void sendMessage(
      {required String reciverId,
      required String content,
      required String chatRoomId}) {
    // Creating New instance of MessageModel
    MessageModel newMessage = MessageModel(
        content: content,
        receiver: reciverId,
        sender: CacheHelper.currentUser.id!,
        timestamp: DateTime.now());
    // Sending The instance to the server
    socket.emit('message', {
      {newMessage.toJson()}
    });
  }

  void joinChatRoom({required String chatRoomId}) {
    socket.emit('joinRoom', {chatRoomId});
  }

  void adminActive() {
    socket.emit('adminActive');
  }

  void userIsTyping() {
    socket.emit('typing');
  }

  void userStopTyping() {
    socket.emit('stopTyping');
  }

  void userDisconnected() {
    socket.emit('disonncet');
  }

  //   SOKCET LISTENERS
  bool connect() {
    socket.connect();
    socket.onConnect((data) => print('Connected'));
    socket.onConnectError((data) => print('Data is ${data}'));
    return socket.connected;
  }

  void listenUseDisconnected({void Function(String)? callback}) {
    socket.onDisconnect((data) => callback);
  }

  void listenChatRoomActive({void Function(String)? callback}) {
    socket.on('chatRoomActive', (chatRoomId) {
      callback!(chatRoomId);
    });
  }

  void listenToMessage({void Function(MessageModel)? callback}) {
    socket.on(ApiKey.message, (message) {
      MessageModel.fromJson(message);
      callback!(message);
    });
  }

  void listenUserTyping({void Function(String)? callback}) {
    socket.on('typing', (data) {
      callback!(data);
    });
  }

  void listenUserStopTyping({void Function(String)? callback}) {
    socket.on('stopTyping', (data) {
      callback!(data);
    });
  }
}
