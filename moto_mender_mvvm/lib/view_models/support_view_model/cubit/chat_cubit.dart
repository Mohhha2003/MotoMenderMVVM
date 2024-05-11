import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:moto_mender_mvvm/cache/cache_helper.dart';
import 'package:moto_mender_mvvm/core/api/endpoints.dart';
import 'package:moto_mender_mvvm/models/chat_models/message_model.dart';
import 'package:moto_mender_mvvm/repos/support_service_repo.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.supportRepo) : super(ChatState.initial()) {
    socket = initialize();
  }

  final TextEditingController chatTextfiled = TextEditingController();

  final SupportServiceRepo supportRepo;

  late IO.Socket socket;
  bool isSocketConnected = false;

  // Future<void> sendMessage({required String reciverId}) async {
  //   final respone = await supportRepo.sendMessage(
  //       chatRoomId: state.chatRoomId!,
  //       reciverId: reciverId,
  //       content: chatTextfiled.text);
  //   respone.fold(
  //       (errorMessage) => emit(state.copyWith(
  //           status: ChatStatus.failed,
  //           errorMessage: errorMessage)), (newMessage) {
  //     ChatState newState = state.addMessage(newMessage);
  //     emit(newState.copyWith(status: ChatStatus.messageSentSuccess));
  //     chatTextfiled.clear();
  //   });
  // }

  Future<void> createChatRoom({required String adminId}) async {
    final response = await supportRepo.createChatRoom(adminId: adminId);
    connectSocket();
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
  }

  // Future<void> getChatRommMessages() async {
  //   final response =
  //       await supportRepo.getChatRoomMessages(chatRoomId: state.chatRoomId!);
  //   response.fold(
  //       (errorMessage) => emit(state.copyWith(
  //           status: ChatStatus.failed,
  //           errorMessage: errorMessage)), (messages) {
  //     emit(state.copyWith(
  //         status: ChatStatus.chatRoomSuccess, messages: messages.messages));
  //   });
  // }

  void newMessageRecived({required MessageModel message}) {
    List<MessageModel> messages = state.messages ?? [];

    emit(
        state.copyWith(status: ChatStatus.messageReceived, messages: messages));
  }

  //   SOCKET METHODS

  IO.Socket initialize() {
    return socket = IO.io(EndPoint.baseUrl, <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false
    });
  }

  void connectSocket() {
    socket.connect();
    socket.onConnect((data) => emit(state.copyWith(status: ChatStatus.chatRoomSuccess)));
    socket.onConnectError((data) => emit(state.copyWith(status: ChatStatus.failed)));
    isSocketConnected = socket.connected;
  }

  void socketSendMessage(
      {required String reciverId, required String chatRoomId}) {
    socket.emit('message', {
      ApiKey.reciverId: reciverId,
      ApiKey.senderId: CacheHelper.currentUser.id!,
      ApiKey.content: chatTextfiled.text,
      ApiKey.chatRoomId: chatRoomId
    });
    ChatState newState =
        state.addMessage(MessageModel(content: chatTextfiled.text));
    userStopTyping();
    emit(newState.copyWith(
        status: ChatStatus.messageSentSuccess, isUserTyping: false));
    chatTextfiled.clear();
  }

  void joinChatRoom({required String chatRoomId}) {
    connectSocket();
    socket.emit('joinRoom', {chatRoomId});
  }

  void listenToMessages() {
    socket.on(ApiKey.message, (message) {
      ChatState newState = state.addMessage(MessageModel.fromJson(message));
      emit(newState.copyWith(status: ChatStatus.messageReceived));
    });
  }

  void userIsTyping() {
    socket.emit('typing');
  }

  void listenUserTyping() {
    socket.on('typing', (data) {
      emit(state.copyWith(isUserTyping: true));
    });
  }

  void listenUserStopTyping() {
    socket.on('stopTyping', (data) {
      emit(state.copyWith(isUserTyping: false));
    });
  }

  void userStopTyping() {
    socket.emit('stopTyping');
  }
}
