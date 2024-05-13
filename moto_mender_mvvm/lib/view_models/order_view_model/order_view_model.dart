import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/core/api/dio_consumer.dart';
import 'package:moto_mender_mvvm/core/get_it/get_it.dart';
import 'package:moto_mender_mvvm/models/order_request/order_request.dart';
import 'package:moto_mender_mvvm/repos/orders_repo.dart';
import 'package:moto_mender_mvvm/utils/functions/floating_bottom_sheet.dart';
import 'package:moto_mender_mvvm/utils/functions/show_loading.dart';
import 'package:moto_mender_mvvm/view/screens/orders_view.dart';
import 'package:moto_mender_mvvm/view_models/order_view_model/cubit/order_cubit.dart';

class OrderViewModel extends StatelessWidget {
  const OrderViewModel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => OrderCubit(OrdersRepo(api: getIt<DioConsumer>())),
        child: BlocConsumer<OrderCubit, OrderState>(
          builder: (context, state) {
            if (state is OrdersSucces) {
              return OrdersView(
                orders: state.orders,
              );
            } else {
              return OrdersView(orders: OrderRequest(orders: [], count: 0));
            }
          },
          listener: (BuildContext context, OrderState state) {
            if (state is OrdersLoading) {
              showLoading(context);
            } else if (state is OrdersFailed) {
              showFloatingBottomSheet(text: state.message, context: context);
            } 
          },
        ));
  }
}
