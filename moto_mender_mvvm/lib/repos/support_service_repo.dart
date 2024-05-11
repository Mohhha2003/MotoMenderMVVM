import 'package:dartz/dartz.dart';
import 'package:moto_mender_mvvm/cache/cache_helper.dart';
import 'package:moto_mender_mvvm/core/api/api_consumer.dart';
import 'package:moto_mender_mvvm/core/api/endpoints.dart';
import 'package:moto_mender_mvvm/core/errors/exceptions.dart';
import 'package:moto_mender_mvvm/core/services/socket_io.dart';
import 'package:moto_mender_mvvm/models/chat_models/chat_room.dart';
import 'package:moto_mender_mvvm/models/chat_models/chat_room_messages_model.dart';
import 'package:moto_mender_mvvm/models/chat_models/message_model.dart';

class SupportServiceRepo {
  final ApiConsumer api;
  late SocketIo _io;

  SupportServiceRepo({required this.api}) {
    _io = SocketIo();
  }

  Future<Either<String, ChatRoom>> createChatRoom(
      {required String adminId}) async {
    try {
      final respone = await api.post(EndPoint.creatChatRoom, data: {
        ApiKey.userId: CacheHelper.currentUser.id,
        ApiKey.adminId: adminId
      });
      return Right(ChatRoom.fromJson(respone));
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, MessageModel>> sendMessage(
      {required String reciverId,
      required String content,
      required String chatRoomId}) async {
    try {
      final response = await api.post(EndPoint.sendMessage, data: {
        ApiKey.reciverId: reciverId,
        ApiKey.senderId: CacheHelper.currentUser.id!,
        ApiKey.content: content,
        ApiKey.chatRoomId: chatRoomId
      });
      return Right(MessageModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, ChatRoomMessagesModel>> getChatRoomMessages(
      {required String chatRoomId}) async {
    try {
      final response = await api.get(EndPoint.getChatRoomMessages,
          data: {ApiKey.chatRoomId: chatRoomId});

      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  //   REIMPLEMENTING THE METHODS USING SOCKET

  // Future<Either<String, MessageModel>> sendMessage({required String chatRoomId,required String content,required reciverId}) async {
  //   try {
  //   final response =  _io.socket.emit(ApiKey.message, {
  //       ApiKey.reciverId: reciverId,
  //       ApiKey.senderId: CacheHelper.currentUser.id!,
  //       ApiKey.content: content,
  //       ApiKey.chatRoomId: chatRoomId
  //     });
  //     return Right(response);
  //   } on ServerException catch (e) {
  //     return Left(e.errorModel.errorMessage);
  //   }
  // }
}
