import 'package:flutter/material.dart';
import 'package:moto_mender_mvvm/cache/cache_helper.dart';
import 'package:moto_mender_mvvm/models/chat_models/message_model.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.message});

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10 ),
      child: Column(
        crossAxisAlignment: message.sender == CacheHelper.currentUser.id
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(12),
                    topRight: const Radius.circular(12),
                    bottomLeft: message.sender == CacheHelper.currentUser.id
                        ? const Radius.circular(12)
                        : Radius.zero,
                    bottomRight: message.sender == CacheHelper.currentUser.id
                        ? Radius.zero
                        : const Radius.circular(12),
                  )),
              child: Column(
                children: [
                  Text(message.content ?? 'unkown'),
                ],
              )),
        ],
      ),
    );
  }
}
