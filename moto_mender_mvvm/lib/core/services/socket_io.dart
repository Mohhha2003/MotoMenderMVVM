import 'package:moto_mender_mvvm/cache/cache_helper.dart';
import 'package:moto_mender_mvvm/core/api/endpoints.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketIo {
  // final List EVENTS = []
  final IO.Socket socket = IO.io(EndPoint.baseUrl, <String, dynamic>{
    "transports": ["websocket"],
    "autoConnect": false
  });

  bool connect() {
    socket.connect();
    socket.onConnect((data) => print('Connected'));
    socket.onConnectError((data) => print('Data is ${data}'));
    return socket.connected;
  }

  void sendMessage(
      {required String reciverId,
      required String content,
      required String chatRoomId}) {
    socket.emit('message', {
      ApiKey.reciverId: reciverId,
      ApiKey.senderId: CacheHelper.currentUser.id!,
      ApiKey.content: content,
      ApiKey.chatRoomId: chatRoomId
    });
  }

  void listenToMessages(Function(dynamic) onMessageReceived) {
    print('Started Listening....');
    socket.on(
        ApiKey.message,
        (message) => {
              print('hello'),
              onMessageReceived(message),
            });
  }

  void joinChatRoom({required String chatRoomId}) {
    socket.emit('joinRoom', {chatRoomId});
  }

  bool isUserTyping() {
    bool isTyping = false;
    socket.on(ApiKey.typing, (data) => isTyping = true);
    if (isTyping) {
      return isTyping;
    }
    return isTyping;
  }
}
