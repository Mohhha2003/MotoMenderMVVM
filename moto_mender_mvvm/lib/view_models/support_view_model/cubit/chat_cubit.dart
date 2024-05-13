import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moto_mender_mvvm/cache/cache_helper.dart';
import 'package:moto_mender_mvvm/core/api/endpoints.dart';
import 'package:moto_mender_mvvm/models/chat_models/message_model.dart';
import 'package:moto_mender_mvvm/repos/support_service_repo.dart';
import 'package:moto_mender_mvvm/utils/functions/navigation_with_slide.dart';
import 'package:moto_mender_mvvm/view_models/support_view_model/support_view_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.supportRepo) : super(ChatState.initial()) {
    // socket = SocketIo();
    intializeSocket();
  }

  final TextEditingController chatTextfiled = TextEditingController();

  final SupportServiceRepo supportRepo;

  // late SocketIo socket;
  late IO.Socket socketIo;

  bool isSocketConnected = false;

  intializeSocket() {
    socketIo = IO.io(EndPoint.baseUrl, <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false
    });
  }

  bool connectSocket() {
    socketIo.connect();
    socketIo.onConnect((data) => print('Connected'));
    socketIo.onConnectError((data) => print('Data is ${data}'));
    return socketIo.connected;
  }

  Future<void> createChatRoom({required String adminId}) async {
    final response = await supportRepo.createChatRoom(adminId: adminId);
    // connectSocket();
    // socketConnect();
    response
        .fold((errorMessage) => emit(state.copyWith(status: ChatStatus.failed)),
            (success) {
      // socket.joinChatRoom(chatRoomId: success.chatRoomId!);
      if (isSocketConnected) {
        emit(
          state.copyWith(
              status: ChatStatus.chatRoomSuccess,
              chatRoomId: success.chatRoomId),
        );
      }
    });
  } //   SOCKET METHODS

  void socketSendMessage(
      {required String reciverId, required String chatRoomId}) {
    MessageModel newMessage = MessageModel(
        content: chatTextfiled.text,
        receiver: reciverId,
        sender: CacheHelper.currentUser.id!,
        timestamp: DateTime.now());
    socketIo.emit('message', {newMessage.toJson()});

    ChatState newState = state.addMessage(newMessage);
    userStopTyping();
    emit(newState.copyWith(
        status: ChatStatus.messageSentSuccess, isUserTyping: false));
    chatTextfiled.clear();
  }

  // SOCKET EMIITERS
  void joinChatRoom({required String chatRoomId}) {
    socketIo.emit('joinRoom', {chatRoomId});
  }

  void adminActive() {
    socketIo.emit('adminActive');
  }

  void userIsTyping() {
    socketIo.emit('typing');
  }

  void userStopTyping() {
    socketIo.emit('stopTyping');
  }

  void userDisconnected() {
    socketIo.disconnect();
  }

  // SOKCET LISTENERS
  void listenChatRoomActive({required BuildContext context}) {
    socketIo.on('chatRoomActive', (chatRoomId) {
      joinChatRoom(chatRoomId: chatRoomId);
      navigationWithSlide(context, const SupportViewModel());
    });
  }

  void listenUserDisconnected() {
    socketIo.onDisconnect((data) {
      print('Disconnected');
      emit(state.copyWith(status: ChatStatus.sessionEnd));
    });
  }

  void listenUserTyping() {
    socketIo.on('typing', (data) {
      emit(state.copyWith(isUserTyping: true));
    });
  }

  void listenUserStopTyping() {
    socketIo.on('stopTyping', (data) {
      print('Stopped Typing');
      emit(state.copyWith(isUserTyping: false));
    });
  }

  void listenToMessages() {
    socketIo.on(ApiKey.message, (message) {
      ChatState newState = state.addMessage(MessageModel.fromJson(message));
      emit(newState.copyWith(status: ChatStatus.messageReceived));
    });
  }

  // //   Socket Class Implement

  // void socketConnect() {
  //   isSocketConnected = socket.connect();
  //   if (isSocketConnected) {
  //     emit(state.copyWith(status: ChatStatus.chatRoomSuccess));
  //   } else {
  //     emit(state.copyWith(status: ChatStatus.failed));
  //   }
  // }
  // //   Socket Emitters

  // void joinRoom(String chatRoomId) {
  //   socket.joinChatRoom(chatRoomId: chatRoomId);
  // }

  // void adminActive() {
  //   socket.adminActive();
  // }

  // void userIsTyping() {
  //   socket.userIsTyping();
  // }

  // void userStopTyping() {
  //   socket.userStopTyping();
  // }

  // //   Socket Listeners

  // void listenChatRoomActive(BuildContext context) {
  //   socket.listenChatRoomActive(
  //     callback: (chatRoomId) {
  //       emit(state.copyWith(
  //           chatRoomId: chatRoomId, status: ChatStatus.chatRoomSuccess));
  //       navigationWithSlide(context, const SupportViewModel());
  //     },
  //   );
  // }

  // void listenToMessage() {
  //   socket.listenToMessage(callback: (message) {
  //     ChatState newState = state.addMessage(message);
  //     emit(newState.copyWith(status: ChatStatus.messageReceived));
  //   });
  // }

  //   void listenUserTyping() {
  //     socket.listenUserTyping(
  //       callback: (p0) {
  //      cubit.  emit(state.copyWith(isUserTyping: true));
  //         print('user is typing');
  //       },
  //     );
  //   }

  // void listeUserStopTyping() {
  //   socket.listenUserStopTyping(
  //     callback: (p0) {
  //       emit(state.copyWith(isUserTyping: false));
  //     },
  //   );
  // }
}
