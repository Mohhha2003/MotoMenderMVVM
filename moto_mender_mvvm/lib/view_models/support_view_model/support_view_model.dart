import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        if (state.status == ChatStatus.chatRoomSuccess ||
            state.status == ChatStatus.initial) {
          return SupportView(
            messages: [],
            state: state,
          );
        } else if (state.status == ChatStatus.messageSentSuccess ||
            state.status == ChatStatus.messageReceived) {
          return SupportView(
            messages: state.messages!,
            state: state,
          );
        } else {
          return const EmptyWidget(text: 'Chat');
        }
      },
      listener: (context, state) {
        if (state.status == ChatStatus.initial) {
          // showLoading(context);
        } else if (state.status == ChatStatus.failed) {
          showFloatingBottomSheet(
              text: state.errorMessage ?? 'unkown error', context: context);
        } else if (state.status == ChatStatus.chatRoomSuccess) {}
      },
    );
  }
}
