import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:moto_mender_mvvm/view/widgets/custom_button.dart';
import 'package:moto_mender_mvvm/view/widgets/sort_and_filter_section.dart';
import 'package:moto_mender_mvvm/view_models/search/cubit/search_cubit.dart';

void showSortAndFilterBottomSheet(BuildContext context,
    GlobalKey<ScaffoldState> scaffoldstate) {
  String sort = '';
  String sortOrder = '';
  scaffoldstate.currentState!.showBottomSheet(
    (context) {
      return Container(
        decoration: const BoxDecoration(
            color: Colors.greenAccent,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        height: MediaQuery.of(context).size.height * .6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Sort&Filter',
              ),
            ),
            SortAndFliterSection(
              onPressed: (param) {
                sort = param;
              },
              title: 'Categories',
              categories: const ["price", "ratingAverage"],
            ),
            SortAndFliterSection(
                onPressed: (param) {
                  sortOrder = param;
                },
                title: 'Type',
                categories: const ["asc", "desc"]),
            SortAndFliterSection(
                onPressed: (param) {
                  sortOrder = param;
                },
                title: 'Range',
                categories: const [
                  "10000 L.E",
                  "20000 L.E",
                  "30000 L.E",
                  "40000 L.E",
                  "50000 L.E"
                ]),
            const Spacer(),
            CustomButton(
              onPressed: () {
                context
                    .read<SearchCubit>()
                    .setQueryParameter(sort: sort, sortOrder: sortOrder);
              },
              style: Theme.of(context).textTheme,
              text: 'Search',
              padding: const EdgeInsets.symmetric(vertical: 20),
            ),
            const Gap(20),
          ],
        ),
      );
    },
  );
}
