import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/core/get_it/get_it.dart';
import 'package:moto_mender_mvvm/repos/store_repo.dart';
import 'package:moto_mender_mvvm/utils/functions/dialog_utils.dart';
import 'package:moto_mender_mvvm/utils/functions/floating_bottom_sheet.dart';
import 'package:moto_mender_mvvm/view/screens/search_view.dart';
import 'package:moto_mender_mvvm/view/widgets/empty_widgets.dart';
import 'package:moto_mender_mvvm/view_models/search/cubit/search_cubit.dart';
import 'package:moto_mender_mvvm/view_models/search/cubit/search_state.dart';

class SearchViewModel extends StatelessWidget {
  const SearchViewModel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
      create: (context) => SearchCubit(getIt<StoreRepo>()),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
          if (state.isLoading) {
            showLoading(context);
          } else if (state.status == SearchStatus.failed) {
            showFloatingBottomSheet(
                text: state.errorMessage!, context: context);
          } else if (state.status == SearchStatus.updated) {
            print(context.read<SearchCubit>().state.queryParameters);
          }
        },
        builder: (context, state) {
          if (state.status == SearchStatus.inital) {
            context.read<SearchCubit>().getSearchProducts();
            return SearchView(state: state);
          }
          return SearchView(state: state);
        },
      ),
    );
  }
}
