import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/core/get_it/get_it.dart';
import 'package:moto_mender_mvvm/repos/store_repo.dart';
import 'package:moto_mender_mvvm/utils/functions/show_loading.dart';
import 'package:moto_mender_mvvm/utils/functions/floating_bottom_sheet.dart';
import 'package:moto_mender_mvvm/view/screens/search_view.dart';
import 'package:moto_mender_mvvm/view_models/search/cubit/search_cubit.dart';
import 'package:moto_mender_mvvm/view_models/search/cubit/search_state.dart';

class SearchViewModel extends StatefulWidget {
  const SearchViewModel({super.key});

  @override
  State<SearchViewModel> createState() => _SearchViewModelState();
}

class _SearchViewModelState extends State<SearchViewModel> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
      create: (context) => SearchCubit(getIt<StoreRepo>()),
      child: BlocListener<SearchCubit, SearchState>(
        listener: (context, state) {
          if (state.isLoading) {
            showLoading(context);
          } else if (state.status == SearchStatus.failed) {
            showFloatingBottomSheet(
                text: state.errorMessage!, context: context);
          } else if (state.status == SearchStatus.updated) {
            Navigator.of(context).pop();
            setState(() {});
          }
        },
        child: SearchView(),
      ),
    );
  }
}
