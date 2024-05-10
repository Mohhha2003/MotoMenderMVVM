import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/models/chat_models/message_model.dart';
import 'package:moto_mender_mvvm/utils/functions/dialog_utils.dart';
import 'package:moto_mender_mvvm/utils/functions/floating_bottom_sheet.dart';
import 'package:moto_mender_mvvm/view/screens/support_service_view.dart';
import 'package:moto_mender_mvvm/view/widgets/empty_widgets.dart';
import 'package:moto_mender_mvvm/view_models/support_view_model/cubit/chat_cubit.dart';

import 'cubit/chat_state.dart';

class SupportViewModel extends StatelessWidget {
  const SupportViewModel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      builder: (context, state) {
        if (state.status == ChatStatus.initial) {
          return Container(
            color: Colors.white,
          );
        }
        if (state.status == ChatStatus.chatRoomSuccess) {
          return const SupportView(messages: []);
        } else if (state.status == ChatStatus.messageSentSuccess) {
          return SupportView(messages: state.messages!);
        } else {
          return const EmptyWidget(text: 'Chat');
        }
      },
      listener: (context, state) {
        if (state.status == ChatStatus.initial) {
          showLoading(context);
        } else if (state.status == ChatStatus.failed) {
          showFloatingBottomSheet(
              text: state.errorMessage ?? 'unkown error', context: context);
        } else if (state.status == ChatStatus.chatRoomSuccess) {}
      },
    );
  }
}
