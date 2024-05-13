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
    // emit(state.copyWith(chatRoomId: chatRoomId));
    socketIo.emit('joinRoom', {chatRoomId});
  }

  void createRoom() {
    socketIo.emit('createRoom', {});
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
    if (CacheHelper.currentUser.role == 'admin') {
      adminActive();
    }
  }

  void adminJoin() {
    socketIo.emit('adminJoin');
  }

  // SOKCET LISTENERS
  void listenToUserJoin({required BuildContext context}) {
    socketIo.on('userJoined', (chatRoomId) {
      print('joind');
      navigationWithSlide(context, const SupportViewModel());
      socketIo.emit('adminJoin');
    });
  }

  void listenSessionEnd() {
    print('Endded');
    socketIo.on('sessionEnd', (data) {
      emit(state.copyWith(status: ChatStatus.sessionEnd, chatRoomId: ''));
    });
  }

  void listenUserDisconnected() {
    socketIo.onDisconnect((data) {
      print('Disconnected');
      emit(state.copyWith(status: ChatStatus.sessionEnd));
    });
  }

  void listenUserTyping() {
    print('Typing');
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

  void listenToRoomCreated() {
    socketIo.on(
        'createRoom',
        (roomId) => emit(state.copyWith(
            chatRoomId: roomId.toString(),
            status: ChatStatus.chatRoomSuccess)));
  }

  void listenToError() {
    socketIo.on(
        'error',
        (errorMessage) => emit(state.copyWith(
            errorMessage: errorMessage, status: ChatStatus.failed)));
  }
}
