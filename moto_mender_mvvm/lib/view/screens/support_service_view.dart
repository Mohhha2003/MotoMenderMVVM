import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/view/widgets/custom_text_field.dart';
import 'package:moto_mender_mvvm/models/chat_models/message_model.dart';
import 'package:moto_mender_mvvm/view_models/support_view_model/cubit/chat_cubit.dart';

class SupportView extends StatelessWidget {
  const SupportView({super.key, required this.messages});

  final List<MessageModel> messages;

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
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.red,
                padding: const EdgeInsets.all(10),
                child: Text(messages[index].content ?? 'unkown'),
              );
            },
          )),
          CustomTextField(
              style: style,
              text: 'Send Message',
              prefixIcon: Icons.message,
              suffix: IconButton(
                  onPressed: () {
                    context
                        .read<ChatCubit>()
                        .sendMessage(reciverId: '6628da3921a3a72fffb3153f');
                  },
                  icon: const Icon(Icons.send)),
              controller: context.read<ChatCubit>().chatTextfiled)
        ],
      ),
    );
  }
}
