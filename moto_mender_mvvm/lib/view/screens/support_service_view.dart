import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/view/widgets/chat_bubble.dart';
import 'package:moto_mender_mvvm/view/widgets/custom_text_field.dart';
import 'package:moto_mender_mvvm/models/chat_models/message_model.dart';
import 'package:moto_mender_mvvm/view_models/support_view_model/cubit/chat_cubit.dart';
import 'package:moto_mender_mvvm/view_models/support_view_model/cubit/chat_state.dart';

class SupportView extends StatefulWidget {
  const SupportView({super.key, required this.messages, required this.state});

  final List<MessageModel> messages;
  final ChatState state;

  @override
  State<SupportView> createState() => _SupportViewState();
}

class _SupportViewState extends State<SupportView> {
  @override
  void initState() {
    context.read<ChatCubit>().listenToMessages();
    context.read<ChatCubit>().listenUserTyping();
    context.read<ChatCubit>().listenUserStopTyping();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: widget.messages.length +
                (context.read<ChatCubit>().state.isUserTyping! ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < widget.messages.length) {
                return ChatBubble(message: widget.messages[index]);
              } else {
                return ChatBubble(
                    message: MessageModel(
                        content: '........', sender: 'fadjslfdslka'));
              }
            },
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
                onChanged: (p0) {
                  context.read<ChatCubit>().userIsTyping();
                },
                onFieldSubmitted: (p0) {
                  context.read<ChatCubit>().userStopTyping();
                },
                onTapOutside: (p0) {
                  context.read<ChatCubit>().userStopTyping();
                },
                padding: const EdgeInsets.symmetric(vertical: 20),
                style: style,
                text: 'Send Message',
                prefixIcon: Icons.message,
                suffix: IconButton(
                    onPressed: () {
                      context.read<ChatCubit>().socketSendMessage(
                          reciverId: '6628da3921a3a72fffb3153f',
                          chatRoomId: '4444');
                    },
                    icon: const Icon(Icons.send)),
                controller: context.read<ChatCubit>().chatTextfiled),
          )
        ],
      ),
    );
  }
}
