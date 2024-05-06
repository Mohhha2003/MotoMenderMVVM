import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:moto_mender_mvvm/cubits/store_cubit/store_cubit.dart';
import 'package:moto_mender_mvvm/view/widgets/custom_search_bar.dart';
import 'package:moto_mender_mvvm/view/widgets/product_grid_view.dart';

import 'sort_and_filter.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  final GlobalKey<ScaffoldState> scaffoldstate = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      key: scaffoldstate,
      appBar: AppBar(
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
              child: ProdcutsGridView(
                  products: context.read<StoreCubit>().products))
        ],
      ),
    ));
  }
}
