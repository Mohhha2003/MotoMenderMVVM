import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/core/get_it/get_it.dart';
import 'package:moto_mender_mvvm/cubits/store_cubit/store_cubit.dart';
import 'package:moto_mender_mvvm/repos/store_repo.dart';
import 'package:moto_mender_mvvm/utils/functions/dialog_utils.dart';
import 'package:moto_mender_mvvm/utils/functions/floating_bottom_sheet.dart';
import 'package:moto_mender_mvvm/view/screens/view_all_view.dart';
import 'package:moto_mender_mvvm/view_models/view_all_view_model/cubit/view_all_cubit.dart';

import 'cubit/view_all_state.dart';

class ViewAllViewModel extends StatelessWidget {
  const ViewAllViewModel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewAllCubit(getIt<StoreRepo>()),
      child: BlocConsumer<ViewAllCubit, ViewAllState>(
        listener: (context, state) {
          if (state.isLoading) {
            showLoading(context);
          } else if (state.status == ViewAllStatus.fetchProductsFailed) {
            showFloatingBottomSheet(text: state.errorMessage, context: context);
          }
        },
        builder: (context, state) {
          return ViewAllView(porducts: state.products);
        },
      ),
    );
  }
}
