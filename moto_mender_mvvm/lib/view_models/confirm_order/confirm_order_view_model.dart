import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/core/api/dio_consumer.dart';
import 'package:moto_mender_mvvm/models/cart_model/cart_product_list_model.dart';
import 'package:moto_mender_mvvm/repos/orders_repo.dart';
import 'package:moto_mender_mvvm/utils/functions/show_loading.dart';
import 'package:moto_mender_mvvm/utils/functions/floating_bottom_sheet.dart';
import 'package:moto_mender_mvvm/utils/functions/navigation_with_slide_replacment.dart';
import 'package:moto_mender_mvvm/view/screens/confirm_order_view.dart';
import 'package:moto_mender_mvvm/view_models/bottom_nav_bar_view_model.dart';
import 'package:moto_mender_mvvm/view_models/confirm_order/cubit/order_cubit.dart';

class ConfirmOrderViewModel extends StatelessWidget {
  const ConfirmOrderViewModel({super.key, this.products});
  final List<CartProductsListModel>? products;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ConfirmOrderCubit(OrdersRepo(api: DioConsumer(dio: Dio()))),
      child: BlocListener<ConfirmOrderCubit, OrderState>(
          listener: (context, state) {
            if (state is OrderLoading) {
              showLoading(context);
            } else if (state is OrderPlaced) {
              Navigator.of(context).pop();
              showFloatingBottomSheet(
                  text: 'Order Placed Successfuly',
                  context: context,
                  backgroundColor: Colors.green);
              slideAndRemove(context, const BottomNavBarViewModel());
            }
          },
          child: ConfirmOrderView(products: products)),
    );
  }
}
