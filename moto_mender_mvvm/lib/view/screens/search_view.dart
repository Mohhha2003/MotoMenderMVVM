import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:moto_mender_mvvm/view/widgets/custom_search_bar.dart';
import 'package:moto_mender_mvvm/view/widgets/product_grid_view.dart';
import 'package:moto_mender_mvvm/view/widgets/view_cart_button.dart';
import 'package:moto_mender_mvvm/view_models/search/cubit/search_cubit.dart';
import 'package:moto_mender_mvvm/view_models/search/cubit/search_state.dart';
import 'sort_and_filter.dart';

class SearchView extends StatelessWidget {
  SearchView({
    super.key,
  });
  final GlobalKey<ScaffoldState> scaffoldstate = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return SafeArea(
            child: Scaffold(
          key: scaffoldstate,
          appBar: AppBar(
            actions: const [CartViewButton()],
            centerTitle: true,
            title: Text(
              'Search',
              style: style.titleLarge,
            ),
          ),
          body: Column(
            children: [
              CustomSearchBar(
                suffixIocn: IconButton(
                    onPressed: () {
                      showSortAndFilterBottomSheet(context, scaffoldstate);
                    },
                    icon: const Icon(Icons.filter_alt_rounded)),
              ),
              const Gap(20),
              Expanded(
                  child: ProductsGirdView(
                      products:
                          BlocProvider.of<SearchCubit>(context).state.products,
                      onEndRached: () =>
                          BlocProvider.of<SearchCubit>(context).onEndReached(),
                      isLoading: BlocProvider.of<SearchCubit>(context)
                          .state
                          .isLoading))
            ],
          ),
        ));
      },
    );
  }
}
