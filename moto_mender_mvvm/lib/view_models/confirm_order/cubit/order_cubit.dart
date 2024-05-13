import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moto_mender_mvvm/cache/cache_helper.dart';
import 'package:moto_mender_mvvm/models/cart_model/cart_product_list_model.dart';
import 'package:moto_mender_mvvm/models/order_request/order_request.dart';
import 'package:moto_mender_mvvm/repos/orders_repo.dart';

part 'order_state.dart';

class ConfirmOrderCubit extends Cubit<OrderState> {
  ConfirmOrderCubit(this.ordersRepo) : super(ConfirmOrderInitial());

  final OrdersRepo ordersRepo;

  Future<void> placeNewOrder(
      {required List<CartProductsListModel> products}) async {
    emit(ConfirmOrderLoading());
    final response = await ordersRepo.placeNewOrder(products: products);
    response
        .fold((errorMessage) => emit(ConfirmOrderFailed(message: errorMessage)),
            (success) {
      
      emit(OrderPlaced());
    });
  }

  Future<void> getUserOrders() async {
    final response =
        await ordersRepo.getUserOrders(userId: CacheHelper.currentUser.id!);
    response.fold(
        (errorMessage) => emit(ConfirmOrderFailed(message: errorMessage)),
        (userOrders) => emit(UserOrdersSuccess(orderRequest: userOrders)));
  }
}
