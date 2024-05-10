import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:moto_mender_mvvm/repos/support_service_repo.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.supportRepo) : super(ChatState.initial());

  final TextEditingController chatTextfiled = TextEditingController();

  final SupportServiceRepo supportRepo;

  Future<void> sendMessage({required String reciverId}) async {
    final respone = await supportRepo.sendMessage(
        chatRoomId: state.chatRoomId!,
        reciverId: reciverId,
        content: chatTextfiled.text);
    respone.fold(
        (errorMessage) => emit(state.copyWith(
            status: ChatStatus.failed,
            errorMessage: errorMessage)), (newMessage) {
      ChatState newState = state.addMessage(newMessage);
      emit(newState.copyWith(status: ChatStatus.messageSentSuccess));
      chatTextfiled.clear();
    });
  }

  Future<void> createChatRoom({required String adminId}) async {
    final response = await supportRepo.createChatRoom(adminId: adminId);
    response.fold(
        (errorMessage) => emit(state.copyWith(status: ChatStatus.failed)),
        (success) => emit(state.copyWith(
            status: ChatStatus.chatRoomSuccess,
            chatRoomId: success.chatRoomId)));
  }

  Future<void> getChatRommMessages() async {
    final response =
        await supportRepo.getChatRoomMessages(chatRoomId: state.chatRoomId!);
    response.fold(
        (errorMessage) => emit(state.copyWith(
            status: ChatStatus.failed, errorMessage: errorMessage)),
        (messages) => emit(state.copyWith(
            status: ChatStatus.chatRoomSuccess, messages: messages.messages)));
  }
}
